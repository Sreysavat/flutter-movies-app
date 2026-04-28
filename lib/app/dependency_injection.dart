import 'package:get/get.dart';
import 'package:sbay_news_app/app/data/provider/api_provider.dart';

import 'data/provider/auth_provider.dart';
class DependencyInjection {
  static void init(){
    Get.put(AuthProvider());
    Get.put(ApiProvider());
  }
}