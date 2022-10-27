// Flutter imports:
import 'package:dictionary/entity/ui_words.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:elementary/elementary.dart';

// Project imports:
import 'package:dictionary/entity/folder.dart';
import 'package:dictionary/ui/screens/words_screen/words_widget_model.dart';
import 'package:dictionary/ui/theme/theme_extensions.dart';
import 'package:dictionary/ui/widgets/segmented_control.dart';
import 'package:dictionary/utils/enums.dart';

class WordsScreen extends ElementaryWidget<IWordsWidgetModel> {
  final Folder folder;

  const WordsScreen({
    Key? key,
    WidgetModelFactory wmFactory = wordsScreenWidgetModelFactory,
    required this.folder,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IWordsWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(
        title: Text(folder.name.replaceAll('', '\u{200B}')),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: wm.onShuffleWords,
            icon: const Icon(Icons.shuffle),
          ),
        ],
      ),
      body: StateNotifierBuilder<TypeSegmentedControl>(
        listenableState: wm.typeSegmentedControl,
        builder: (_, typeSegmentedControl) {
          return Column(
            children: [
              _ChangerVisibilityCollumn(
                groupValue: typeSegmentedControl!,
                onChange: wm.onChangeColumnVisibility,
              ),
              Expanded(
                child: Stack(
                  children: [
                    const Center(
                      child: VerticalDivider(
                        thickness: 1,
                        width: 0,
                      ),
                    ),
                    StateNotifierBuilder<List<UiWord>>(
                      listenableState: wm.uiWords,
                      builder: (_, uiWords) {
                        return ListView.separated(
                          itemCount: uiWords!.length,
                          itemBuilder: (_, index) {
                            final uiWord = uiWords[index];
                            return Stack(
                              children: [
                                Row(
                                  children: [
                                    _Word(
                                      word: uiWord.word,
                                      isShow: uiWord.isShowWord,
                                      onChangeVisibility: typeSegmentedControl == TypeSegmentedControl.hideWord
                                          ? () => wm.onChangeVisibilityWord(uiWord)
                                          : () => wm.onSayWord(uiWord),
                                    ),
                                    _Word(
                                      word: uiWord.translation,
                                      isShow: uiWord.isShowTranslation,
                                      onChangeVisibility: typeSegmentedControl == TypeSegmentedControl.hideTranslation
                                          ? () => wm.onChangeVisibilityTranslation(uiWord)
                                          : () => wm.onSayWord(uiWord),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (_, index) {
                            return const Divider(thickness: 1, height: 0);
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ChangerVisibilityCollumn extends StatelessWidget {
  final TypeSegmentedControl groupValue;
  final void Function(TypeSegmentedControl) onChange;

  const _ChangerVisibilityCollumn({
    Key? key,
    required this.groupValue,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SegmentedControl(
            groupValue: groupValue,
            padding: EdgeInsets.zero,
            onValueChanged: onChange,
            borderColor: Colors.transparent,
            selectedColor: Theme.of(context).scaffoldBackgroundColor,
            unselectedColor: Theme.of(context).extension<AppColors>()!.segmentedControlUnselected,
            pressedColor: Theme.of(context).extension<AppColors>()!.segmentedControlPressed,
            children: const {
              TypeSegmentedControl.hideWord: _SegmentedControlItem(text: 'Скрыть слова'),
              TypeSegmentedControl.showAll: _SegmentedControlItem(text: 'Отображать всё'),
              TypeSegmentedControl.hideTranslation: _SegmentedControlItem(text: 'Скрыть перевод'),
            },
          ),
        ),
      ],
    );
  }
}

class _SegmentedControlItem extends StatelessWidget {
  final String text;
  const _SegmentedControlItem({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).extension<AppColors>()!.segmentedControlText,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _Word extends StatelessWidget {
  final String word;

  final StateNotifier<bool> isShow;
  final void Function()? onChangeVisibility;

  const _Word({
    Key? key,
    required this.word,
    required this.isShow,
    required this.onChangeVisibility,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onChangeVisibility,
        child: StateNotifierBuilder<bool>(
          listenableState: isShow,
          builder: (_, isShow) {
            return Opacity(
              opacity: isShow! ? 1 : 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                child: Center(
                  child: Text(
                    word,
                    style: const TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
