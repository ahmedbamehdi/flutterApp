// pages/LoginPage.dart
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smart_car_parking/components/MyButton.dart';
import 'package:smart_car_parking/components/MyTextField.dart';
import 'package:smart_car_parking/pages/MapPage.dart';
import 'package:smart_car_parking/pages/SignUP.dart';
import 'package:smart_car_parking/pages/homepage/homepage.dart';
import 'package:smart_car_parking/pages/login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController demo = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade200,
        title: Text(" L O G I N    تسجيل الدخول"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(children: [
              Row(
                children: [
                  Text(
                    "أهلاً وسهلاً بكم",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "LOGIN",
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              SizedBox(height: 30),
              MyTextField(
                  icons: Icons.email, lable: "البريد الإلكتروني", Onchange: demo),
              SizedBox(height: 10),
              MyTextField(
                  icons: Icons.password, lable: "كلمة المرور", Onchange: demo),
              SizedBox(height: 90),
              MyButton(
                icon: Icons.admin_panel_settings_rounded,
                Btname: "تسجيل الدخول ",
                ontap: () {
                  //sGet.offAll(); //hona database de autentification
                },
              ),
               SizedBox(height: 20),
               MyButton(
                 icon: Icons.person_add,
                 Btname: "إنشاء حساب",
                 ontap: () {
                  Get.to(SignUpPage());
                  }, //hona database de autentification
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
