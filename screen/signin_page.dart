import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/provider/todo_provider.dart';
import 'package:todo_app/state/state.dart';

// class SignInPage extends StatefulHookConsumerWidget {
//   // const SignInPage({Key? key}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     final email = ref.watch(emailProvider);
//     final password = ref.watch(passwordProvider);
//
//     final emailController = useTextEditingController(text: email);
//     final passwordController = useTextEditingController(text: password);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('ログイン'),
//       ),
//       body: SafeArea(
//         child: Container(
//           child: Form(
//             key: ,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TextFormField(
//                   decoration: const InputDecoration(
//                     border: UnderlineInputBorder(),
//                     labelText: 'メールアドレスを入力してください',
//                   ),
//                   controller: emailController,
//                   onChanged: (value) {
//                     ref.watch(emailProvider.notifier).state = value;
//                   },
//                 ),
//                 TextFormField(
//                   decoration: const InputDecoration(
//                     border: UnderlineInputBorder(),
//                     labelText: 'パスワードを入力してください',
//                   ),
//                   controller: passwordController,
//                   onChanged: (value) {
//                     ref.watch(passwordProvider.notifier).state = value;
//                   },
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                     onPressed: () async {
//                       ref
//                           .read(todoStateProvider.notifier)
//                           .signIn(email, password);
//                       context.go('/select');
//                     },
//                     child: Text('ログイン')),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SignInPage extends StatefulHookConsumerWidget {
//   @override
//   SignInPageState createState() => SignInPageState();
// }
//
// class SignInPageState extends ConsumerState<SignInPage> {
//   @override
//   Widget build(BuildContext context) {
//     final email = ref.watch(emailProvider);
//     final password = ref.watch(passwordProvider);
//
//     final emailController = useTextEditingController(text: email);
//     final passwordController = useTextEditingController(text: password);
//     final _formKey = GlobalKey<FormState>();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('ログイン'),
//       ),
//       body: SafeArea(
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextFormField(
//                 autofocus: true,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'メールアドレスが入力されていません!';
//                   }
//                   return null;
//                 },
//                 decoration: const InputDecoration(
//                   border: UnderlineInputBorder(),
//                   labelText: 'メールアドレスを入力してください',
//                 ),
//                 controller: emailController,
//                 onChanged: (value) {
//                   ref.watch(emailProvider.notifier).state = value;
//                 },
//               ),
//               TextFormField(
//                 autofocus: true,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'パスワードが入力されていません!';
//                   }
//                   return null;
//                 },
//                 decoration: const InputDecoration(
//                   border: UnderlineInputBorder(),
//                   labelText: 'パスワードを入力してください',
//                 ),
//                 controller: passwordController,
//                 onChanged: (value) {
//                   ref.watch(passwordProvider.notifier).state = value;
//                 },
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                   onPressed: () async {
//                     if (_formKey.currentState!.validate()) {
//                       ref
//                           .read(todoStateProvider.notifier)
//                           .signIn(email, password);
//                       context.go('/select');
//                     } else {
//                       // フォームが有効でなければ、スナックバーを表示する。
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text('ユーザ情報の入力をお願いします!')),
//                       );
//                     }
//                   },
//                   child: Text('ログイン')),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class SignInPage extends StatefulHookConsumerWidget {
  @override
  SignInPageState createState() => SignInPageState();
}

class SignInPageState extends ConsumerState<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final email = ref.watch(emailProvider);
    final password = ref.watch(passwordProvider);

    final emailController = useTextEditingController(text: email);
    final passwordController = useTextEditingController(text: password);
    // 上記で作成した_formKeyを使ってFormウィジェットを作ります。
    return Scaffold(
      appBar: AppBar(
        title: const Text('ログイン'),
      ),
      body: Container(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  // validatorは、ユーザーが入力したテキストを受け取ります。
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'メールアドレスが入力されていません!';
                    }
                    return null;
                  },
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
                  // validatorは、ユーザーが入力したテキストを受け取ります。
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'パスワードが入力されていません!';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'パスワードを入力してください',
                  ),
                  controller: passwordController,
                  onChanged: (value) {
                    ref.watch(passwordProvider.notifier).state = value;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ref
                            .read(todoStateProvider.notifier)
                            .signIn(email, password);
                        context.go('/select');
                      } else {
                        // フォームが有効でなければ、スナックバーを表示する。
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('ユーザ情報の入力をお願いします!')),
                        );
                      }
                    },
                    child: const Text('ログイン'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
