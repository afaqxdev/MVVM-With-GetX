import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm/repository/home_repository/home_repository.dart';
import 'package:mvvm/res/routes/routes_name.dart';
import 'package:mvvm/view/home/widget/user_listbuilder/user_listbuilder.dart';
import 'package:mvvm/view_model/controller/home/home_user_view.dart';

import '../../data/response/status.dart';
import '../../res/Color/app_colors.dart';
import '../../res/component/gernal_exception.dart';
import '../../res/component/internet_exception_widget.dart';
import '../../view_model/controller/user_prefrence/user_preference_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Userpreference userpreference = Userpreference();
  final homeController = Get.put(HomeController());
  @override
  void initState() {
    // TODO: implement initState
    homeController.userApiList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.greenColor,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                userpreference.reomveUser().then((value) {
                  Get.delete<HomeController>();
                  Get.toNamed(RoutesNAme.LoginView);
                });
              },
              icon: const Icon(Icons.logout_outlined))
        ],
        automaticallyImplyLeading: false,
      ),
      body: Obx(() {
        switch (homeController.rxRequestStatus.value) {
          case Status.LOADING:
            // ignore: prefer_const_constructors
            return Center(
              child: const CircularProgressIndicator(),
            );
          case Status.ERROR:
            if (homeController.error.value == "No internet") {
              return InternetExceptionWidget(
                onPress: () {
                  homeController.refreshuserApi();
                },
              );
            } else {
              return GeneralException(
                onPress: () {
                  homeController.refreshuserApi();
                },
              );
            }
          case Status.COMPELET:
            return Column(
              children: [
                20.ph,
                UserListBuilder(),
              ],
            );
        }
      }),
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
