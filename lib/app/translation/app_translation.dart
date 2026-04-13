import 'package:get/get.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'news': 'News',
      'news_details': 'News Details',
    },
    'km_KH': {
      'news': 'ព័ត៌មាន',
      'news_details': 'សារព័ត៌មាន',
    }
  };
}