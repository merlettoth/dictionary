class Word {
  final String word;
  final String translation;

  Word({
    required this.word,
    required this.translation,
  });

  factory Word.fromJson(MapEntry<String, dynamic> entry) {
    return Word(
      word: entry.key,
      translation: entry.value as String,
    );
  }
}
