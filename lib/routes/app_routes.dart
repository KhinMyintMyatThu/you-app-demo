import 'package:get/get.dart';
import 'package:you_app_demo/utils/constants/route_constants.dart';
import 'package:you_app_demo/pages/interest_page.dart';
import 'package:you_app_demo/pages/landing_page.dart';
import 'package:you_app_demo/pages/login_page.dart';
import 'package:you_app_demo/pages/profile_page.dart';
import 'package:you_app_demo/pages/register_page.dart';

class AppRoutes {
  // Route onGenerateRoute(RouteSettings settings) {
  //   switch (settings.name) {
  //     case rootRoute:
  //       return MaterialPageRoute(builder: (_) => const ProfilePage());
  //     case loginRoute:
  //       return MaterialPageRoute(builder: (_) => const LoginPage());
  //     case registerRoute:
  //       return MaterialPageRoute(builder: (_) => const RegisterPage());
  //     case profileRoute:
  //       return MaterialPageRoute(builder: (_) => const ProfilePage());
  //     case interestRoute:
  //       return MaterialPageRoute(builder: (_) => const EditableChipFieldApp());
  //     default:
  //       return MaterialPageRoute(builder: (_) => const LandingPage());
  //   }
  // }
  static final routes = [
    GetPage(name: rootRoute, page: () => const LandingPage()),
    GetPage(name: loginRoute, page: () => LoginPage()),
    GetPage(name: registerRoute, page: () => RegisterPage()),
    GetPage(name: profileRoute, page: () => const ProfilePage()),
    GetPage(name: interestRoute, page: () => const InterestPage()),
  ];
}
