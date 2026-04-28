
import 'package:dio/dio.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sbay_news_app/app/config/app_config.dart';

import '../model/req/login_req.model.dart';
import '../model/req/register_req.model.dart';
class AuthProvider extends GetxService{
late Dio _dio;
  @override
  void onInit() {
    _initializeDio();
    super.onInit();
  }
  void _initializeDio(){
    _dio =Dio(
        BaseOptions(
            baseUrl:"${kBaseUrlLog}/api",
            followRedirects: false,
            validateStatus: (status){
              return status! <500;
            },
            headers: {
              'Content-Type': "application/json",
              'Accept': "application/json"
            }
        )
    );
  }
  Future<Response>login(LoginReq req) async{
    return await _dio.post('/login?token=123',data: req.toJson());
  }
  Future<Response>register(RegisterReq req) async{
    return await _dio.post('/register', data: req.toJson());
  }
}