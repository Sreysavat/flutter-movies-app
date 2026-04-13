import 'package:get/get.dart';
import 'package:sbay_news_app/app/data/model/news_model.dart';

class NewsDetailsController extends GetxController {
  Rxn<Articles> article = Rxn<Articles>();
  void getNewsDetail(){
    final articleAg = Get.arguments;
      article.value = articleAg;
  }

  @override
  void onInit() {
    getNewsDetail();
    super.onInit();
  }
}
