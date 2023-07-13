import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery/const/app_strings.dart';
import 'package:food_delivery/ui/route/routes.dart';
import 'package:food_delivery/ui/style/app_style.dart';
import 'package:food_delivery/ui/views/onboarding.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  chooseScreen() {
    //timer vs future.delayed
    final box = GetStorage();
    var value = box.read('value');

    if (value == true) {
      Get.toNamed(home);
    } else {
      Get.toNamed(onboarding);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(const Duration(seconds: 2), () => chooseScreen());
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
