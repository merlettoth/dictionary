// Dart imports:
import 'dart:io';

// Package imports:
import 'package:shared_preferences/shared_preferences.dart';

class DictionaryDataProvider {
  final _key = 'dictionary_key';

  late final SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String getDictionary() {
    return _prefs.getString(_key) ?? '';
  }

  Future<void> setDictionary(String path) async {
    final file = File(path);
    final dictionary = await file.readAsString();
    await _prefs.setString(_key, dictionary);
  }
}
