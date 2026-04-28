import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sbay_news_app/app/data/model/req/register_req.model.dart';
import 'package:sbay_news_app/app/dependency_injection.dart';
import 'package:sbay_news_app/app/modules/register/controllers/register_controller.dart';
import 'package:sbay_news_app/app/routes/app_pages.dart';

class RegisterView extends GetView<RegisterController> {
   RegisterView({super.key});
  final _formKey = GlobalKey<FormState>();
  final _nameCon = TextEditingController();
  final _emailCon = TextEditingController();
  final _passCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    DependencyInjection.init();
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
                  Icon(Icons.psychology_outlined, size: 50, color: Colors.pink),
                  Text(
                    "Welcome to login\nAccount",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.yellow,
                      fontWeight: FontWeight.w700,
                      fontSize: 36,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 300,
            right: 30,
            child: Container(
              padding: EdgeInsets.all(16),
              width: 350,
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Column(
                      children: [
                        TextFormField(
                          controller: _nameCon,
                          decoration: InputDecoration(
                            labelText: "Name",
                            fillColor: Color(0xFFF5F5F5),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (v){
                            if(v == null || v.isEmpty){
                              return "Name is required";
                            }
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _emailCon,
                          decoration: InputDecoration(
                            labelText: "Email",
                            fillColor: Color(0xFFF5F5F5),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (v){
                            if(v == null || v.isEmpty){
                              return "email is required";
                            }
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _passCon,
                          decoration: InputDecoration(
                            labelText: "Password",
                            fillColor: Color(0xFFF5F5F5),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (v){
                            if(v == null || v.isEmpty){
                              return "Password is Invalid";
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          final req = RegisterReq(
                            name: _nameCon.text,
                            email: _emailCon.text,
                            password: _passCon.text);
                          controller.register(req);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(16),
                          ),
                          backgroundColor: Colors.blue,
                        ),
                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
