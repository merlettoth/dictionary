// Package imports:
import 'package:get_it/get_it.dart';

// Project imports:
import 'package:dictionary/data/data_provider/dictionary_data_provider.dart';
import 'package:dictionary/data/repository/dictionary_repository.dart';
import 'package:dictionary/data/services/dictionary_picker_service.dart';
import 'package:dictionary/data/services/speak_service.dart';

GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  final dictionaryDataProvider = DictionaryDataProvider();
  final dictionaryRepository = DictionaryRepository(dictionaryDataProvider);
  final dictionaryPickerService = DictionaryPickerService();
  final speakService = SpeakService();

  await dictionaryDataProvider.init();
  await speakService.init();

  getIt.registerLazySingleton<DictionaryRepository>(() => dictionaryRepository);
  getIt.registerLazySingleton<DictionaryPickerService>(() => dictionaryPickerService);
  getIt.registerLazySingleton<SpeakService>(() => speakService);
}
