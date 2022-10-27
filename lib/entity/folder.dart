// Project imports:
import 'package:dictionary/entity/word.dart';

class Folder {
  final String name;
  final List<Folder>? folders;
  final List<Word>? words;

  Folder({
    required this.name,
    this.folders,
    this.words,
  });

  factory Folder.fromJson(Map<String, dynamic> json) {
    return Folder(
      name: json['name'] as String,
      folders:
          (json['folders'] as List<dynamic>?)?.map((dynamic e) => Folder.fromJson(e as Map<String, dynamic>)).toList(),
      words: (json['words'] as Map<String, dynamic>?)
          ?.entries
          .map((MapEntry<String, dynamic> e) => Word.fromJson(e))
          .toList(),
    );
  }
}
