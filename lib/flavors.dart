import 'package:flutter/cupertino.dart';
import 'package:sbay_news_app/app/config/app_config.dart';

enum Flavor {
  dev,
  prod,
}

class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;
  static String  baseUrl =kBaseUrlLog;

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        baseUrl= kBaseUrlLog;
        return 'SalaitBlog-Dev';
      case Flavor.prod:
        baseUrl = kBaseUrlLog;
        return 'Salait Blog';
    }
  }

}