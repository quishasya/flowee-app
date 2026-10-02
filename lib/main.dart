import 'package:flowee_app/screens/splash_screen.dart';
import 'package:flowee_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const OsmaApp());
}

class OsmaApp extends StatelessWidget {
  const OsmaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flowee App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      builder: (context, child) {
        return Container(
          decoration: const BoxDecoration(
            gradient: AppTheme.appBackgroundGradient,
          ),
          child: child,
        );
      },
      home: const SplashScreen(),
    );
  }
}