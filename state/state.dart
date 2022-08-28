import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/model/todo/todo_model.dart';
import 'package:todo_app/provider/todo_provider.dart';

final todoStateProvider =
    StateNotifierProvider<TodoState, AsyncValue<List<TodoModel>>>((ref) {
  return TodoState(ref.read);
});

class TodoState extends StateNotifier<AsyncValue<List<TodoModel>>> {
  TodoState(this._read) : super(const AsyncValue.loading());
  // 外部からProviderを取得可能にする
  final Reader _read;

  Future<void> signUp(name, email, password) async {
    print('Listで新規登録');
    // FirebaseAuthが用意しているメールアドレスとパスワードを登録する関数を定義
    UserCredential result =
        await _read(firebaseAuthProvider).createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    // 上のFirebaseAuthから、uidを取得する変数を定義
    final user = result.user;
    final uid = user?.uid;
    // usersコレクションを作成して、uidとドキュメントidを一致させるプログラムを定義
    final users = _read(firebaseProvider).collection('users').doc(uid).set({
      'uid': uid,
      'name': name,
      'email': email,
    });
  }

  Future<void> signIn(email, password) async {
    print('Listでログインする');
    try {
      final credential = await _read(firebaseAuthProvider)
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('該当するメールアドレスが存在しません');
      } else if (e.code == 'wrong-password') {
        print('パスワードが間違っています');
      }
    }
  }

  Future<void> signOut() async {
    print('ログアウト');
    await _read(firebaseAuthProvider).signOut();
  }

  Future<void> addTodo(String text) async {
    print('新しいList型のStateで実行');
    final uid = await _read(firebaseAuthProvider).currentUser?.uid;
    final ref = await _read(firebaseProvider)
        .collection('users')
        .doc(uid)
        .collection('todos')
        .add({'text': text});
  }

  Future<void> deleteTodo() async {
    final uid = await _read(firebaseAuthProvider).currentUser?.uid;
    final ref = await _read(firebaseProvider)
        .collection('users')
        .doc(uid)
        .collection('todos')
        .doc(uid)
        .delete();
  }
}
