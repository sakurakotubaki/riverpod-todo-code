import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/provider/todo_provider.dart';
import 'package:todo_app/state/state.dart';

class PostPage extends HookConsumerWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textValue = ref.watch(textProvider);
    final textController = useTextEditingController(text: textValue);

    return Scaffold(
      appBar: AppBar(
        title: const Text('StartPage'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: textController,
              onChanged: (value) {
                if (kDebugMode) {
                  print(value);
                }
                ref.read(textProvider.notifier).state = value;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  ref.read(todoStateProvider.notifier).addTodo(textValue);
                },
                child: Text('保存'))
          ],
        ),
      ),
    );
  }
}
