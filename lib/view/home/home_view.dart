import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm/res/routes/routes_name.dart';

import '../../res/Color/app_colors.dart';
import '../../view_model/controller/user_prefrence/user_preference_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Userpreference userpreference = Userpreference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.greenColor,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                userpreference.reomveUser().then((value) {
                  Get.toNamed(RoutesNAme.LoginView);
                  print("working");
                });
              },
              icon: const Icon(Icons.logout_outlined))
        ],
        automaticallyImplyLeading: false,
      ),
    );
  }
}
