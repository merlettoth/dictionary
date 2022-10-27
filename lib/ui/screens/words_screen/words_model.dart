// Package imports:
import 'package:elementary/elementary.dart';

// Project imports:
import 'package:dictionary/data/services/speak_service.dart';

class WordsModel extends ElementaryModel {
  final SpeakService _speakService;

  WordsModel(this._speakService);

  void speak(String text) => _speakService.speak(text);
}
