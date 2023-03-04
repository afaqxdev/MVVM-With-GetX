import 'dart:async';

import 'package:get/get.dart';
import 'package:mvvm/res/routes/routes_name.dart';

import '../controller/user_prefrence/user_preference_view_model.dart';

class SplashServices {
  Userpreference userpreference = Userpreference();

  void isLogin() {
    userpreference.getUser().then((value) {
      // ignore: avoid_print
      print(value.token);
      // ignore: avoid_print
      print(value.isLogin);
      if (value.isLogin == false || value.isLogin.toString() == 'null') {
        Timer(const Duration(seconds: 3),
            () => Get.toNamed(RoutesNAme.LoginView));
      } else {
        Timer(
            const Duration(seconds: 3), () => Get.toNamed(RoutesNAme.HomeView));
      }
    });
  }
}
