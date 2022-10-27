// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: invalid_use_of_visible_for_testing_member

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:elementary/elementary.dart';

// Project imports:
import 'package:dictionary/entity/folder.dart';
import 'package:dictionary/ui/screens/folders_screen/folders_screen.dart';
import 'package:dictionary/ui/screens/words_screen/words_screen.dart';

extension WidgetModelExtension on WidgetModel {
  void openFolder(Folder folder) {
    if (folder.folders != null) {
      _push(FoldersScreen(folder: folder));
    } else if (folder.words != null) {
      _push(WordsScreen(folder: folder));
    }
  }

  void _push(Widget screen) {
    Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (_) => screen,
      ),
    );
  }
}
