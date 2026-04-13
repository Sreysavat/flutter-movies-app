import 'package:dio/dio.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sbay_news_app/app/config/app_config.dart';
class ApiProvider extends GetxService{
  late Dio _dio;


  @override
  void onInit() {
    initializeDio();
    super.onInit();
  }
  void initializeDio(){
    _dio = Dio(BaseOptions(
      baseUrl: kBaseUrl,
      followRedirects: false,
      validateStatus: (status){
        return status! < 500;
      },
      headers: {
        'Content-Type' :"application/json",
        'Accept' : "application/json"
      }
    ));
  }
  Future <Response> fetchNews() async{
    try{
      final res = await _dio.get("api/v4/search?q=example&lang=en&country=en&max=10&apikey=${kAPIKey}");
  return res;
    }catch(e){
      rethrow;
    }
  }
}