import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:sbay_news_app/app/data/model/news_model.dart';
import 'package:sbay_news_app/app/data/provider/api_provider.dart';

class HomeController extends GetxController {
  final _apiProvider = Get.find<ApiProvider>();
  Rx<NewsModel> news = Rx(NewsModel());
  var isLoading = false.obs;
  var hasConnection = false.obs;
 @override
  void onReady() {
   FlutterNativeSplash.remove();
   StreamSubscription<List<ConnectivityResult>>? subscription;
   subscription = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result) {
     _checkInternetConnection();
   });
    super.onReady();
  }
  Future<void> _checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      hasConnection.value = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
      debugPrint('Internet Connection: $hasConnection');
      Get.closeAllSnackbars();
      getNews();
    } on SocketException {
      hasConnection (false);
      Get.snackbar("Error Connection", "check your connection",
      backgroundColor: Colors.red,
      isDismissible: false,
      overlayBlur: 7,
      duration: null,
      );
      debugPrint('Internet Connection: $hasConnection');
    }
    debugPrint('Emitting connection status: $hasConnection');
  }
  @override
  void onInit() {
    getNews();
    super.onInit();
  }
 void chooseYourLang(){
    Get.defaultDialog(
        title: "Choose Your language",
        content:Column(
          children: [
            ListTile(title: Text("Khmer"),onTap: (){
              Get.updateLocale(Locale('km'));
              Get.back();
            },),
            ListTile(title: Text("English"),onTap: (){
              Get.updateLocale(Locale('en'));
              Get.back();
            },),
          ],

    ));
 }

  void changeTheme(){
    Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
  }

  void getNews() async{
    try {
      isLoading (true);
      final res = await _apiProvider.fetchNews();
      if (res.statusCode != 200) {
        throw res.statusMessage ?? "Something went wrong";
      }
      final data = res.data;
      news.value = NewsModel.fromJson(data)
;    }catch(e){
      Get.snackbar("Error", e.toString());
    }
    finally{
    isLoading (false);
    }
  }
}