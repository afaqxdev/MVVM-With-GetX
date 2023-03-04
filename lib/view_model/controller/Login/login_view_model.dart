import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm/repository/login_repository/login_repository.dart';
import 'package:mvvm/model/login_model/userModel.dart';
import 'package:mvvm/utils/utils.dart';

import '../../../res/routes/routes_name.dart';
import '../user_prefrence/user_preference_view_model.dart';

class LoginViewModel extends GetxController {
  Userpreference userpreference = Userpreference();

  final _api = LoginRespository();
  final emailcontroler = TextEditingController().obs;
  final passwordcontroler = TextEditingController().obs;
  final passwordFocusNode = FocusNode().obs;
  final emailFocusNode = FocusNode().obs;
  RxBool loding = false.obs;
  void loginApi() {
    loding.value = true;

    Map data = {
      'email': emailcontroler.value.text,
      'password': passwordcontroler.value.text
    };
    _api.loginApi(data).then((value) {
      loding.value = false;
      if (value['error'] == 'user not found') {
        uitls.snackBar(value['error'], 'Login');
      }
      {
        UserModel userModel = UserModel(token: value['token'], isLogin: true);
        userpreference.saveUser(userModel).then((value) {
          Get.delete<LoginViewModel>();
          Get.toNamed(RoutesNAme.HomeView)!.then((value) {});
        }).onError((error, stackTrace) {});
        uitls.snackBar("Login Successfully", "Login");
      }
    }).onError((error, stackTrace) {
      loding.value = false;

      uitls.snackBar(error.toString(), "Error");
    });
  }
}
