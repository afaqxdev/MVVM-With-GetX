import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm/data/response/login_repository/login_repository.dart';
import 'package:mvvm/utils/utils.dart';

class LoginViewModel extends GetxController {
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
        uitls.snackBar("Login Successfully", "Login");
      }
    }).onError((error, stackTrace) {
      loding.value = false;

      uitls.snackBar(error.toString(), "Error");
    });
  }
}
