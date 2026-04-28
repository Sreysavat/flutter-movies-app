import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sbay_news_app/widget/form_cus_log.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
          ),
          Positioned(
              child: Container(
                  padding: EdgeInsets.all(50),
                  width: double.infinity,
                  height: 400,
                  color: Colors.blue,
                  child: Column(
                    spacing: 16,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.psychology_outlined,size: 50,color: Colors.pink,),
                      Text("Welcome to login\nAccount",textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.yellow,
                            fontWeight: FontWeight.w700,
                            fontSize: 36
                        ),
                      ),
                    ],
                  )
              )),
          Positioned(
            top: 300,
            right: 30,
            child: Container(
              padding: EdgeInsets.all(16),
              width:350,
              height: 500,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white),
              child:FormCusLog(),
            ),
          )
        ],
      ),
    );
  }
}
