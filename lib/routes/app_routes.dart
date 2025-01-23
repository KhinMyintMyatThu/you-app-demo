import 'package:get/get.dart';
import 'package:you_app_demo/utils/constants/route_constants.dart';
import 'package:you_app_demo/pages/interest_page.dart';
import 'package:you_app_demo/pages/landing_page.dart';
import 'package:you_app_demo/pages/login_page.dart';
import 'package:you_app_demo/pages/profile_page.dart';
import 'package:you_app_demo/pages/register_page.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: rootRoute, page: () => const LandingPage()),
    GetPage(name: loginRoute, page: () => LoginPage()),
    GetPage(name: registerRoute, page: () => RegisterPage()),
    GetPage(name: profileRoute, page: () => const ProfilePage()),
    GetPage(name: interestRoute, page: () => const InterestPage()),
  ];
}
