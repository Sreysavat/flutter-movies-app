import 'package:get/get.dart';
import 'package:sbay_news_app/app/data/model/req/register_req.model.dart';
import 'package:sbay_news_app/app/data/provider/auth_provider.dart';

class RegisterController extends GetxController {
  final _provider = Get.find<AuthProvider>();

  void register(RegisterReq req) async{
    try{
      final response = await _provider.register(req);
      if(response.statusCode == 200){
        Get.back();
        return;
      }
      throw Exception(response.data["message"]);
    }catch(e){
      Get.defaultDialog(middleText: e.toString());
    }
  }
}
