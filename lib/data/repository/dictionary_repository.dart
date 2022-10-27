// Dart imports:
import 'dart:convert';

// Project imports:
import 'package:dictionary/data/data_provider/dictionary_data_provider.dart';
import 'package:dictionary/entity/folder.dart';

class DictionaryRepository {
  final DictionaryDataProvider _dataProvider;

  DictionaryRepository(this._dataProvider);

  Future<Folder> getDictionary() {
    final data = _dataProvider.getDictionary();
    if (data.isEmpty) {
      return Future.value(Folder(name: ''));
    }
    final json = jsonDecode(data) as Map<String, dynamic>;
    final folder = Folder.fromJson(json);
    return Future.value(folder);
  }

  Future<void> setDictionary(String path) {
    return _dataProvider.setDictionary(path);
  }
}
