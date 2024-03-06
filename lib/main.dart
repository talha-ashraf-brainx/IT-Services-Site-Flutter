import 'package:flutter/material.dart';
import 'package:it_services_site/presentation/pages/home.dart';
import 'package:it_services_site/shared/constants/app_colors.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: ThemeData(
        colorScheme: AppColors.colorSchemeLight,
        primaryColor: AppColors.primary,
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
