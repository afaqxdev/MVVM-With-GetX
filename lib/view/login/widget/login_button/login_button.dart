import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../../../res/component/round_button.dart';
import '../../../../view_model/controller/Login/login_view_model.dart';

class LoginButton extends StatelessWidget {
  final formkey;
  LoginButton({required this.formkey, super.key});
  final logControler = Get.put(LoginViewModel());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return RoundButton(
            width: 200,
            title: "Login",
            loading: logControler.loding.value,
            onPres: () {
              if (formkey.currentState!.validate()) {
                logControler.loginApi();
                logControler.emailcontroler.value.clear();
                logControler.passwordcontroler.value.clear();
              }
            });
      },
    );
  }
}
