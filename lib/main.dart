// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_displaymode/flutter_displaymode.dart';

// Project imports:
import 'package:dictionary/data/service_locator.dart';
import 'package:dictionary/ui/app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await FlutterDisplayMode.setHighRefreshRate();
  await setupServiceLocator();

  runApp(const App());
}
