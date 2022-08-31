import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_save/provider/provider.dart';

final nameStateProvider =
    StateNotifierProvider<NameState, AsyncValue<String>>((ref) {
  return NameState(ref.read);
});

class NameState extends StateNotifier<AsyncValue<String>> {
  NameState(this._read) : super(const AsyncValue.loading());
  final Reader _read;

  // ドキュメント通りに、prefs.setStringで、String型のデータを保存
  Future<void> saveData() async {
    print('riverpodで保存');
    // _nameControllerを代入する
    String nameValue = _read(nameControllerProvider.state).state.text;
    print(nameValue);
    // providerをFutureProviderにすると、setStringが使えなくなる!
    final prefs = await _read(sharedPreferencesProvider);
    // nameValueを"name"がキーのprefs.setStringで使う。
    await prefs.setString("name", nameValue);
  }

  Future<void> getData() async {
    print('riverpodで表示');
    final prefs = await _read(sharedPreferencesProvider);
    var textInit = _read(textInitProvider.state).state;
    textInit = prefs.getString("name") ?? "値が入っていない!";
    print(textInit);
  }

  Future<void> removeData() async {
    print('riverpodで削除');
    final prefs = await _read(sharedPreferencesProvider);
    prefs.remove("name");
    final textInit = _read(textInitProvider.state).state;
    print(textInit);
  }
}
