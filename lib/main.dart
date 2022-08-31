import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_save/provider/provider.dart';
import 'package:local_save/screen/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  // `runApp` 関数が終わる前に何か処理を実行する場合は `ensureInitialized()` メソッドを追記する必要がある
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(
          // ここでインスタンス化し、Providerの値を上書きします
          await SharedPreferences.getInstance(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'SharedPreferences Demo',
      home: Home(),
    );
  }
}
