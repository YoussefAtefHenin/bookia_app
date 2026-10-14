import 'package:bookia/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          30.verticalSpace,
          Center(
            child: Text(
              "Welcome back! Glad to see you, Again!",
              style: AppTextStyles.titleRegular,
            ),
          ),
        ],
      ),
    );
  }
}
