import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mvvm/res/component/internet_exception_widget.dart';

import '../res/component/gernal_exception.dart';
import '../res/component/round_button.dart';
import '../res/image/image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors

    return Scaffold(
      appBar: AppBar(
        title: const Text("Splash"),
        centerTitle: true,
      ),
      body: Column(children: [
        GernalException(
          onPress: () {},
        ),
        RoundButton(
          onPres: () {},
          title: "button",
          width: 200,
        )
      ]),
    );
  }
}
