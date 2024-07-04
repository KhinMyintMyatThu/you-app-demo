import 'package:flutter/material.dart';
import 'package:you_app_demo/utils/constants/route_constants.dart';
import 'package:you_app_demo/presentation/screens/interest_screen.dart';
import 'package:you_app_demo/presentation/screens/landing_screen.dart';
import 'package:you_app_demo/presentation/screens/login_screen.dart';
import 'package:you_app_demo/presentation/screens/profile_screen.dart';
import 'package:you_app_demo/presentation/screens/register_screen.dart';

import '../../utils/widgets/input_chip.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case rootRoute:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case profileRoute:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case interestRoute:
        return MaterialPageRoute(builder: (_) => EditableChipFieldApp());
      default:
        return MaterialPageRoute(builder: (_) => const LandingScreen());
    }
  }
}
