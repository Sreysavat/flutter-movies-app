import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sbay_news_app/app/data/model/req/login_req.model.dart';
import 'package:sbay_news_app/app/routes/app_pages.dart';

import '../app/modules/login/controllers/login_controller.dart';

class FormCusLog extends GetView<LoginController>  {
  final controller = Get.put(LoginController());
   FormCusLog({super.key});
  final String imageEmail = "assets/images/google.png";
  final _formKey = GlobalKey<FormState>();
  final _emailCon = TextEditingController();
  final _passCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Form(
      key: _formKey,
      child: Column(
        children: [
          Image.asset(imageEmail),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Expanded(
                child: Divider(
                  thickness: 1,
                  color: Colors.grey,),),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text("or login with",
                  style: TextStyle(fontSize: 10),),),
              Expanded(
                child: Divider(
                  thickness: 0.5,
                  color: Colors.grey,),
              ),
            ],
          ),
          Column(
            children: [
              TextFormField(
                controller: _emailCon,
                decoration: InputDecoration(
                  labelText: "Email",
                  fillColor: Color(0xFFF5F5F5),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:BorderSide.none
                  ),
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: _passCon,
                decoration: InputDecoration(
                labelText: "Password",
                fillColor: Color(0xFFF5F5F5),
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:BorderSide.none
                ),
              ),)
            ],
          ),
          SizedBox(height: 20,),
      SizedBox(
          width: 300,
          height: 50,
          child: ElevatedButton(onPressed: () {
    final req = LoginReq(
    email: _emailCon.text,
    password: _passCon.text);
    controller.login(req);
    },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
        backgroundColor: Colors.blue,
      ),
      child: Text("Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,),
      ),),),

          SizedBox(height: 20,),
          Row(
            children: [
              Icon(Icons.check_box_outline_blank,color: Colors.grey,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                spacing: 40,
                children: [
                  TextButton(onPressed: (){}, child: Text("Remember me")),
                  TextButton(onPressed: (){
                  }, child: Text("Forgot password?",style: TextStyle(color: Colors.blue,
                      fontSize: 13
                  )
                  )),
                ],
              )
            ],
          ),
          SizedBox(height: 20,),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have account?"),
              SizedBox(width: 20,),
              TextButton(onPressed: (){}, child:
              TextButton(onPressed: (){
                Get.toNamed(Routes.REGISTER);
              },child:
              Text("Sign up",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.blueAccent),))
              )
            ],
          )
        ],

      ),
    );
  }
}
