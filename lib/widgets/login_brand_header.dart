import 'package:flowee_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class LoginBrandHeader extends StatelessWidget {
  const LoginBrandHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/image/logo.png',
          height: 200,
          width: 200,
        ),
        Text(
          'Your perfect smell starts here',
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.85),
            fontSize: 13
          ),
        )
      ],
    );
  }
}