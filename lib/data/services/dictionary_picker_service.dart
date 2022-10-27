// Package imports:
import 'package:file_picker/file_picker.dart';

class DictionaryPickerService {
  final _picker = FilePicker.platform;

  Future<String?> getPathDictionaryFile() async {
    await _picker.clearTemporaryFiles();
    final result = await _picker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
    );
    return result?.paths.first!;
  }
}
