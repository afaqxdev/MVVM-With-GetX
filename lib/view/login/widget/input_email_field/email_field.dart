import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm/utils/utils.dart';
import '../../../../res/Color/app_colors.dart';
import '../../../../view_model/controller/Login/login_view_model.dart';

class InputEmailField extends StatelessWidget {
  InputEmailField({super.key});
  final logControler = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: logControler.emailcontroler.value,
      focusNode: logControler.emailFocusNode.value,
      validator: (value) {
        if (value!.isEmpty) {
          uitls.snackBar("Please enter Email", "Email");
        }
        return null;
      },
      onFieldSubmitted: (value) {
        uitls.fieldFocusChange(context, logControler.emailFocusNode.value,
            logControler.passwordFocusNode.value);
      },
      decoration: InputDecoration(
          hintText: 'hint_email'.tr,
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.greenColor))),
    );
  }
}
