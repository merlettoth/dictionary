// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:elementary/elementary.dart';

// Project imports:
import 'package:dictionary/entity/folder.dart';
import 'package:dictionary/ui/screens/primary_folders_screen/primary_folders_widget_model.dart';
import 'package:dictionary/ui/widgets/folders_list.dart';

class PrimaryFoldersScreen extends ElementaryWidget<IPrimaryFoldersWidgetModel> {
  const PrimaryFoldersScreen({
    Key? key,
    WidgetModelFactory wmFactory = primaryFoldersWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IPrimaryFoldersWidgetModel wm) {
    return StateNotifierBuilder<bool>(
      listenableState: wm.isLoading,
      builder: (_, isLoading) {
        return Stack(
          children: [
            Scaffold(
              body: SafeArea(
                child: StateNotifierBuilder<List<Folder>>(
                  listenableState: wm.folders,
                  builder: (_, folders) {
                    if (folders == null) {
                      return const Center(
                        child: Text(
                          'Словарь пуст',
                          style: TextStyle(fontSize: 20),
                        ),
                      );
                    }
                    return FoldersList(folders: folders, onTapFolder: wm.onOpenFolder);
                  },
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: isLoading! ? null : wm.onSetDictionary,
                disabledElevation: 0,
                child: const Icon(Icons.download),
              ),
            ),
            if (isLoading)
              Container(
                width: double.infinity,
                height: double.infinity,
                color: const Color.fromRGBO(0, 0, 0, 0.4),
                child: const CupertinoActivityIndicator(radius: 100, color: Colors.white),
              ),
          ],
        );
      },
    );
  }
}
