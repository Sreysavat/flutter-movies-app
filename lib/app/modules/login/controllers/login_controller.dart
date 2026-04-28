import 'package:get/get.dart';
import 'package:sbay_news_app/app/data/model/req/login_req.model.dart';
import 'package:sbay_news_app/app/data/provider/auth_provider.dart';
import 'package:sbay_news_app/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final _provider = Get.find<AuthProvider>();

  void login(LoginReq req) async{
    try{
      final response = await _provider.login(req);
      if(response.statusCode == 200){
        Get.offAndToNamed(Routes.HOME);
        return;
      }
      throw Exception(response.data["message"]);
    }catch(e){
      Get.defaultDialog(middleText: e.toString());
    }
  }
}
