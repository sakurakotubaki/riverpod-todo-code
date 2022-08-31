import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final textInitProvider = StateProvider((ref) {
  return "初期値は何もない!";
});

final nameControllerProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final sharedPreferencesProvider = Provider<SharedPreferences>((_) => throw UnimplementedError());
