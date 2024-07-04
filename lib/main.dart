import 'package:flutter/material.dart';
import 'package:you_app_demo/utils/constants/route_constants.dart';
import 'package:you_app_demo/presentation/router/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  
  final AppRouter _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const LandingScreen(),
      onGenerateRoute: _appRouter.onGenerateRoute,
      initialRoute: rootRoute,
    );
  }
}
