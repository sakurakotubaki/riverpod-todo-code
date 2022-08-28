import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/provider/todo_provider.dart';
import 'package:todo_app/state/state.dart';

class MyHomePage extends HookConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<QuerySnapshot> firebaseTodos = ref.watch(todosProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('MyHomePage'),
      ),
      body: Container(
        child: Container(
          child: firebaseTodos.when(
            // データがあった（データはqueryの中にある）
            data: (QuerySnapshot query) {
              // todos内のドキュメントをリストで表示する
              return ListView(
                children: query.docs.map((document) {
                  return Slidable(
                    endActionPane: ActionPane(
                      motion: DrawerMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (value) {
                            print('編集ボタンが押された');
                          },
                          backgroundColor: Colors.blue,
                          icon: Icons.pending,
                          label: '編集',
                        ),
                        SlidableAction(
                          onPressed: (value) {
                            print('削除ボタンが押された');
                            ref.read(todoStateProvider.notifier).deleteTodo();
                          },
                          backgroundColor: Colors.red,
                          icon: Icons.delete,
                          label: '削除',
                        ),
                      ],
                    ),
                    child: ListTile(
                      // todosで送った内容を表示する
                      title: Text(document['text']),
                    ),
                  );
                }).toList(),
              );
            },
            // データの読み込み中（FireStoreではあまり発生しない）
            loading: () {
              return const Text('Loading');
            },
            // エラー（例外発生）時
            error: (e, stackTrace) {
              return Text('error: $e');
            },
          ),
        ),
      ),
    );
  }
}
