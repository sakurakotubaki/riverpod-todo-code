import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/provider/todo_provider.dart';
import 'package:todo_app/state/state.dart';

class SignUpPage extends HookConsumerWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);
    final email = ref.watch(emailProvider);
    final password = ref.watch(passwordProvider);
    final nameController = useTextEditingController(text: name);
    final emailController = useTextEditingController(text: email);
    final passwordController = useTextEditingController(text: password);

    return Scaffold(
      appBar: AppBar(
        title: const Text('新規登録'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: '名前を入力してください',
              ),
              controller: nameController,
              onChanged: (value) {
                ref.watch(nameProvider.notifier).state = value;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'メールアドレスを入力してください',
              ),
              controller: emailController,
              onChanged: (value) {
                ref.watch(emailProvider.notifier).state = value;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'パスワードを入力してください',
              ),
              controller: passwordController,
              onChanged: (value) {
                ref.watch(passwordProvider.notifier).state = value;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {
                  ref
                      .read(todoStateProvider.notifier)
                      .signUp(name, email, password);
                  context.go('/select');
                },
                child: Text('新規登録')),
          ],
        ),
      ),
    );
  }
}
