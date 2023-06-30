import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery/const/app_strings.dart';
import 'package:food_delivery/ui/route/routes.dart';
import 'package:food_delivery/ui/style/app_style.dart';
import 'package:food_delivery/ui/views/onboarding.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  chooseScreen() {
    //timer vs future.delayed
    Timer(const Duration(seconds: 2), () => Get.toNamed(onboarding));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    chooseScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            AppStrings.appName,
            style: AppStyle.fontsize20(30),
          ),
          const SizedBox(
            height: 15,
          ),
          const LinearProgressIndicator(),
        ]),
      ),
    );
  }
}
