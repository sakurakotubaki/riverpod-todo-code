import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final textProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});

final nameProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});

final emailProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});

final passwordProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});

final usersProvider = StreamProvider.autoDispose((_) {
  return FirebaseFirestore.instance.collection('users').snapshots();
});

final todosProvider = StreamProvider.autoDispose((_) {
  final uid = FirebaseAuth.instance.currentUser?.uid;
  return FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .collection('todos')
      .snapshots();
});
