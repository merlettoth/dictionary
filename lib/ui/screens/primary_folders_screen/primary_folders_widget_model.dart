// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:elementary/elementary.dart';

// Project imports:
import 'package:dictionary/data/repository/dictionary_repository.dart';
import 'package:dictionary/data/service_locator.dart';
import 'package:dictionary/data/services/dictionary_picker_service.dart';
import 'package:dictionary/entity/folder.dart';
import 'package:dictionary/ui/screens/primary_folders_screen/primary_folders_model.dart';
import 'package:dictionary/ui/screens/primary_folders_screen/primary_folders_screen.dart';
import 'package:dictionary/utils/extension/widget_model_extension.dart';

abstract class IPrimaryFoldersWidgetModel extends IWidgetModel {
  ListenableState<bool> get isLoading;
  ListenableState<List<Folder>> get folders;
  Future<void> Function() get onSetDictionary;
  void Function(Folder) get onOpenFolder;
}

PrimaryFoldersWidgetModel primaryFoldersWidgetModelFactory(BuildContext context) {
  return PrimaryFoldersWidgetModel(
    PrimaryFoldersModel(
      getIt<DictionaryRepository>(),
      getIt<DictionaryPickerService>(),
    ),
  );
}

class PrimaryFoldersWidgetModel extends WidgetModel<PrimaryFoldersScreen, PrimaryFoldersModel>
    implements IPrimaryFoldersWidgetModel {
  PrimaryFoldersWidgetModel(PrimaryFoldersModel model) : super(model);

  final _isLoading = StateNotifier<bool>(initValue: false);
  final _folders = StateNotifier<List<Folder>>(initValue: []);

  @override
  ListenableState<bool> get isLoading => _isLoading;

  @override
  ListenableState<List<Folder>> get folders => _folders;

  @override
  Future<void> Function() get onSetDictionary => _setDictionary;

  @override
  void Function(Folder) get onOpenFolder => openFolder;

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _getDictionary();
  }

  Future<void> _setDictionary() async {
    _isLoading.accept(true);
    await model.setDictionary();
    final dictionary = await model.getDictionary();
    _folders.accept(dictionary.folders);
    _isLoading.accept(false);
  }

  Future<void> _getDictionary() async {
    _isLoading.accept(true);
    final dictionary = await model.getDictionary();
    _folders.accept(dictionary.folders);
    _isLoading.accept(false);
  }
}
