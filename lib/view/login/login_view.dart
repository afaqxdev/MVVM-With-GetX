// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm/res/color/app_colors.dart';
import 'package:mvvm/res/component/round_button.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view/login/widget/input_email_field/email_field.dart';
import 'package:mvvm/view/login/widget/input_password_field/password_field.dart';

import '../../view_model/controller/Login/login_view_model.dart';
import 'widget/login_button/login_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formkey = GlobalKey<FormState>();
  final logControler = Get.put(LoginViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.orangeColor,
      appBar: AppBar(
        title: Text("login".tr),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    InputEmailField(),
                    20.ph,
                    InputPasswordField(),
                  ],
                ),
              ),
              40.ph,
              LoginButton(
                formkey: _formkey,
              )
            ]),
      ),
    );
  }
}

extension on num {
  SizedBox get ph => SizedBox(
        height: toDouble(),
      );
  // ignore: unused_element
  SizedBox get pw => SizedBox(
        height: toDouble(),
      );
}
