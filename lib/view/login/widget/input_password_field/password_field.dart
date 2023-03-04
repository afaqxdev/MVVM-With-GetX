import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm/utils/utils.dart';
import '../../../../res/Color/app_colors.dart';
import '../../../../view_model/controller/Login/login_view_model.dart';

class InputPasswordField extends StatelessWidget {
  InputPasswordField({super.key});
  final logControler = Get.put(LoginViewModel());
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: logControler.passwordcontroler.value,
      focusNode: logControler.passwordFocusNode.value,
      validator: (value) {
        if (value!.isEmpty) {
          uitls.snackBar("Please enter Email", "Email");
        }
        return null;
      },
      obscureText: true,
      obscuringCharacter: '*',
      decoration: InputDecoration(
          hintText: 'hint_password'.tr,
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.greenColor))),
    );
  }
}
