// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:dictionary/ui/screens/primary_folders_screen/primary_folders_screen.dart';
import 'package:dictionary/ui/theme/themes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dictionary',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const PrimaryFoldersScreen(),
    );
  }
}
