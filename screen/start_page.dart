import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StartPage'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    context.go('/signIn');
                  },
                  child: const Text('Login')),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    context.go('/signUp');
                  },
                  child: const Text('New User')),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
