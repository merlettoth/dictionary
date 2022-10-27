// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:elementary/elementary.dart';

// Project imports:
import 'package:dictionary/data/service_locator.dart';
import 'package:dictionary/data/services/speak_service.dart';
import 'package:dictionary/entity/ui_words.dart';
import 'package:dictionary/ui/screens/words_screen/words_model.dart';
import 'package:dictionary/ui/screens/words_screen/words_screen.dart';
import 'package:dictionary/utils/enums.dart';

abstract class IWordsWidgetModel extends IWidgetModel {
  StateNotifier<List<UiWord>> get uiWords;
  StateNotifier<TypeSegmentedControl> get typeSegmentedControl;
  void Function(TypeSegmentedControl) get onChangeColumnVisibility;
  void Function(UiWord) get onChangeVisibilityWord;
  void Function(UiWord) get onChangeVisibilityTranslation;
  void Function(UiWord) get onSayWord;
  void Function() get onShuffleWords;
}

WordsWidgetModel wordsScreenWidgetModelFactory(BuildContext context) {
  return WordsWidgetModel(
    WordsModel(
      getIt<SpeakService>(),
    ),
  );
}

class WordsWidgetModel extends WidgetModel<WordsScreen, WordsModel> implements IWordsWidgetModel {
  WordsWidgetModel(WordsModel model) : super(model);

  final _uiWords = StateNotifier<List<UiWord>>(initValue: []);
  final _typeSegmentedControl = StateNotifier<TypeSegmentedControl>(initValue: TypeSegmentedControl.showAll);

  @override
  StateNotifier<List<UiWord>> get uiWords => _uiWords;

  @override
  StateNotifier<TypeSegmentedControl> get typeSegmentedControl => _typeSegmentedControl;

  @override
  void Function(TypeSegmentedControl) get onChangeColumnVisibility => _changeColumnVisibility;

  @override
  void Function(UiWord uiWord) get onChangeVisibilityWord => _changeVisibilityWord;

  @override
  void Function(UiWord uiWord) get onChangeVisibilityTranslation => _changeVisibilityTranslation;

  @override
  void Function(UiWord) get onSayWord => _sayWord;

  @override
  void Function() get onShuffleWords => _shuffleWords;

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _initWordsTranslates();
  }

  void _initWordsTranslates() {
    final uiWords = <UiWord>[];
    final words = widget.folder.words!;
    words.sort((a, b) => a.word.compareTo(b.word));
    for (final word in words) {
      uiWords.add(
        UiWord(
          word: word.word.trim().toLowerCase(),
          translation: word.translation.trim().toLowerCase(),
        ),
      );
    }
    _uiWords.accept(uiWords);
  }

  void _changeColumnVisibility(TypeSegmentedControl type) {
    _typeSegmentedControl.accept(type);
    for (final uiWord in _uiWords.value!) {
      uiWord.isShowWord.accept(type != TypeSegmentedControl.hideWord);
      uiWord.isShowTranslation.accept(type != TypeSegmentedControl.hideTranslation);
    }
  }

  void _changeVisibilityWord(UiWord uiWord) {
    uiWord.isShowWord.accept(!uiWord.isShowWord.value!);
  }

  void _changeVisibilityTranslation(UiWord uiWord) {
    uiWord.isShowTranslation.accept(!uiWord.isShowTranslation.value!);
  }

  void _sayWord(UiWord uiWord) => model.speak(uiWord.word);

  void _shuffleWords() {
    final uiWords = _uiWords.value!.toList();
    uiWords.shuffle();
    _uiWords.accept(uiWords);
    _changeColumnVisibility(_typeSegmentedControl.value!);
  }
}
