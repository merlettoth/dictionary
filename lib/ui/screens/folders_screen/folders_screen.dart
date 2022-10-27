// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:elementary/elementary.dart';

// Project imports:
import 'package:dictionary/entity/folder.dart';
import 'package:dictionary/ui/screens/folders_screen/folders_widget_model.dart';
import 'package:dictionary/ui/widgets/folders_list.dart';

class FoldersScreen extends ElementaryWidget<IFoldersWidgetModel> {
  final Folder folder;

  const FoldersScreen({
    Key? key,
    WidgetModelFactory wmFactory = foldersScreenWidgetModelFactory,
    required this.folder,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IFoldersWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(
        title: Text(folder.name.replaceAll('', '\u{200B}')),
        centerTitle: true,
      ),
      body: FoldersList(folders: folder.folders!, onTapFolder: wm.onOpenFolder),
    );
  }
}
