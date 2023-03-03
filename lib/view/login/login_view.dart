import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:mvvm/res/color/app_colors.dart';
import 'package:mvvm/res/component/round_button.dart';
import 'package:mvvm/utils/utils.dart';

import '../../view_model/controller/login_view_model.dart';

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
                    TextFormField(
                      controller: logControler.emailcontroler.value,
                      focusNode: logControler.emailFocusNode.value,
                      validator: (value) {
                        if (value!.isEmpty) {
                          uitls.snackBar("Please enter Email", "Email");
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {
                        uitls.fieldFocusChange(
                            context,
                            logControler.emailFocusNode.value,
                            logControler.passwordFocusNode.value);
                      },
                      decoration: InputDecoration(
                          hintText: 'hint_email'.tr,
                          border: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColor.greenColor))),
                    ),
                    20.ph,
                    TextFormField(
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
                              borderSide:
                                  BorderSide(color: AppColor.greenColor))),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Obx(
                () {
                  return RoundButton(
                      width: 200,
                      title: "Login",
                      loading: logControler.loding.value,
                      onPres: () {
                        if (_formkey.currentState!.validate()) {
                          logControler.loginApi();
                        }
                      });
                },
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
  SizedBox get pw => SizedBox(
        height: toDouble(),
      );
}
