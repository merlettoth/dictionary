// Package imports:
import 'package:flutter_tts/flutter_tts.dart';

class SpeakService {
  final _tts = FlutterTts();

  Future<void> init() async {
    await _tts.setVoice({"name": "en-us-x-tpd-network", "locale": "en-US"});
    await _tts.setVolume(1);
  }

  void speak(String text) {
    _tts.speak(text);
  }
}
