import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_app_demo/controllers/auth_controller.dart';
import 'package:you_app_demo/pages/landing_page.dart';
import 'package:you_app_demo/pages/profile_page.dart';
import 'package:you_app_demo/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // final AppRouter _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Obx(() { return authController.isLoggedIn.value ? const ProfilePage() : const LandingPage();}),
      getPages: AppRoutes.routes,
    );
  }
}
