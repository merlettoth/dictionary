// Package imports:
import 'package:elementary/elementary.dart';

class UiWord {
  final String word;
  final String translation;
  final isShowWord = StateNotifier<bool>(initValue: true);
  final isShowTranslation = StateNotifier<bool>(initValue: true);

  UiWord({required this.word, required this.translation});
}
