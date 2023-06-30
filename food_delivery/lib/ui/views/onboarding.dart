import 'package:flutter/material.dart';
import 'package:food_delivery/ui/route/routes.dart';
import 'package:food_delivery/ui/views/auth/login.dart';
import 'package:get/get.dart';

import 'package:onboarding_intro_screen/onboarding_screen.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingScreen(
        onSkip: () {
          Get.toNamed(login);
        },
        showPrevNextButton: true,
        showIndicator: true,
        backgourndColor: Colors.white,
        activeDotColor: Colors.blue,
        deactiveDotColor: Colors.grey,
        iconColor: Colors.black,
        leftIcon: Icons.arrow_circle_left_rounded,
        rightIcon: Icons.arrow_circle_right_rounded,
        iconSize: 30,
        pages: [
          OnBoardingModel(
            image: Image.asset("assets/images/img3.jpeg"),
            title: "Business Chat",
            body:
                "First impressions are everything in business, even in chat service. It’s important to show professionalism and courtesy from the start",
          ),
          OnBoardingModel(
            image: Image.asset("assets/images/img3.jpeg"),
            title: "Coffee With Friends",
            body:
                "When your morning starts with a cup of coffee and you are used to survive the day with the same, then all your Instagram stories and snapchat streaks would stay filled up with coffee pictures",
          ),
        ],
      ),
    );
  }
}
