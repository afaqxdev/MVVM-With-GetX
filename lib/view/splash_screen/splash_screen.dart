import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm/view_model/services/splash_services.dart';
import '../../res/Color/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices services = SplashServices();
  @override
  void initState() {
    super.initState();
    services.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.grayColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('wellcome_back'.tr,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20))
          ],
        ),
      ),
    );
  }
}
