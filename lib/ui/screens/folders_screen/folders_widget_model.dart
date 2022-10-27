// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:elementary/elementary.dart';

// Project imports:
import 'package:dictionary/entity/folder.dart';
import 'package:dictionary/ui/screens/folders_screen/folders_model.dart';
import 'package:dictionary/ui/screens/folders_screen/folders_screen.dart';
import 'package:dictionary/utils/extension/widget_model_extension.dart';

abstract class IFoldersWidgetModel extends IWidgetModel {
  void Function(Folder) get onOpenFolder;
}

FoldersWidgetModel foldersScreenWidgetModelFactory(BuildContext context) {
  return FoldersWidgetModel(FoldersModel());
}

class FoldersWidgetModel extends WidgetModel<FoldersScreen, FoldersModel> implements IFoldersWidgetModel {
  FoldersWidgetModel(FoldersModel model) : super(model);

  @override
  void Function(Folder) get onOpenFolder => openFolder;

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    widget.folder.folders?.sort((a, b) => a.name.compareTo(b.name));
  }
}
