// Package imports:
import 'package:elementary/elementary.dart';

// Project imports:
import 'package:dictionary/data/repository/dictionary_repository.dart';
import 'package:dictionary/data/services/dictionary_picker_service.dart';
import 'package:dictionary/entity/folder.dart';

class PrimaryFoldersModel extends ElementaryModel {
  final DictionaryRepository _dictionaryRepository;
  final DictionaryPickerService _dictionaryPickerService;

  PrimaryFoldersModel(this._dictionaryRepository, this._dictionaryPickerService);

  Future<void> setDictionary() async {
    final filePath = await _dictionaryPickerService.getPathDictionaryFile();
    if (filePath != null) {
      await _dictionaryRepository.setDictionary(filePath);
    }
  }

  Future<Folder> getDictionary() => _dictionaryRepository.getDictionary();
}
