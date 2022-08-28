import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/state/state.dart';

class SelectPage extends HookConsumerWidget {
  const SelectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                ref.read(todoStateProvider.notifier).signOut();
                context.go('/');
              },
              icon: Icon(Icons.logout))
        ],
        title: const Text('SelectPage'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    context.go('/myhome');
                  },
                  child: const Text('MyHomaPage')),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    context.go('/post');
                  },
                  child: const Text('PostPage')),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
