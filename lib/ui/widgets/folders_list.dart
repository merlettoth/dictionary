// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:dictionary/entity/folder.dart';
import 'package:dictionary/ui/widgets/folder_card.dart';

class FoldersList extends StatelessWidget {
  final List<Folder> folders;
  final void Function(Folder) onTapFolder;

  const FoldersList({
    Key? key,
    required this.folders,
    required this.onTapFolder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      itemCount: folders.length,
      itemBuilder: (context, index) {
        return FolderCard(
          name: folders[index].name,
          onTap: () => onTapFolder(folders[index]),
        );
      },
    );
  }
}
