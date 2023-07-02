import 'package:food_delivery/ui/views/auth/login.dart';
import 'package:food_delivery/ui/views/auth/sign_up.dart';
import 'package:food_delivery/ui/views/home.dart';
import 'package:food_delivery/ui/views/onboarding.dart';
import 'package:food_delivery/ui/views/splash.dart';
import 'package:get/get.dart';

const String splash = '/splash';
const String onboarding = '/onboarding';
const String home = '/home';
const String login = '/login';
const String signup = '/signup';

List<GetPage> getpages = [
  GetPage(name: splash, page: () => const Splash()),
  GetPage(name: onboarding, page: () => const OnBoarding()),
  GetPage(name: home, page: () => const Home()),
  GetPage(name: login, page: () => Login()),
  GetPage(name: signup, page: () => Signup()),
];
