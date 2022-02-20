import 'package:get/get.dart';
import 'package:superhero/app/translations/locales/en_us_translation.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => <String, Map<String, String>>{
        'en_US': enUs,
      };
}
