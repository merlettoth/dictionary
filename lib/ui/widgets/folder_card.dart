// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:dictionary/ui/theme/theme_extensions.dart';

class FolderCard extends StatelessWidget {
  final String name;
  final void Function() onTap;

  const FolderCard({
    Key? key,
    required this.name,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Material(
        color: Theme.of(context).extension<AppColors>()!.card,
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                name,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
