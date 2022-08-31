import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_save/provider/provider.dart';
import 'package:local_save/state/name_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = nameControllerProvider;
    final initText = ref.watch(textInitProvider.state);
    return Scaffold(
      appBar: AppBar(
        title: Text('ローカルに保存'),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            Text(
              initText.state,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: "お名前を入力してください"),
              controller: ref.watch(nameController.state).state,
            ),
            Row(
              children: [
                const SizedBox(width: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {
                    ref.read(nameStateProvider.notifier).saveData();
                  },
                  child: Text('保存'),
                ),
                const SizedBox(width: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {
                    ref.read(nameStateProvider.notifier).getData();
                  },
                  child: Text('表示'),
                ),
                const SizedBox(width: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {
                    ref.read(nameStateProvider.notifier).removeData();
                  },
                  child: Text('削除'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
