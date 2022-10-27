// Flutter imports:
import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color? card;
  final Color? segmentedControlText;
  final Color? segmentedControlPressed;
  final Color? segmentedControlUnselected;

  const AppColors({
    required this.card,
    required this.segmentedControlText,
    required this.segmentedControlPressed,
    required this.segmentedControlUnselected,
  });

  @override
  AppColors copyWith({
    Color? card,
    Color? segmentedControlText,
    Color? segmentedControlPressed,
    Color? segmentedControlUnselected,
  }) {
    return AppColors(
      card: card ?? this.card,
      segmentedControlText: segmentedControlText ?? this.segmentedControlText,
      segmentedControlPressed: segmentedControlPressed ?? this.segmentedControlPressed,
      segmentedControlUnselected: segmentedControlUnselected ?? this.segmentedControlUnselected,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      card: Color.lerp(card, other.card, t),
      segmentedControlText: Color.lerp(segmentedControlText, other.segmentedControlText, t),
      segmentedControlPressed: Color.lerp(segmentedControlPressed, other.segmentedControlPressed, t),
      segmentedControlUnselected: Color.lerp(segmentedControlUnselected, other.segmentedControlUnselected, t),
    );
  }
}
