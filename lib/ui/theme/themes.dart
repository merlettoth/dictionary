// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:dictionary/ui/theme/theme_extensions.dart';

final lightTheme = ThemeData.light().copyWith(
  extensions: <ThemeExtension<AppColors>>[
    AppColors(
      card: Colors.lightBlue[100],
      segmentedControlText: Colors.black,
      segmentedControlUnselected: Colors.red,
      segmentedControlPressed: Colors.red,
    ),
  ],
);

final darkTheme = ThemeData.dark().copyWith(
  extensions: <ThemeExtension<AppColors>>[
    const AppColors(
      card: Color(0xFF424242),
      segmentedControlText: Colors.white,
      segmentedControlUnselected: Color(0xFF424242),
      segmentedControlPressed: Color(0xFF585858),
    ),
  ],
);
