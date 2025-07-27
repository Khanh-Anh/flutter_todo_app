import 'package:flutter/cupertino.dart';
import 'package:to_do_app/core/design_system/theme/app_colors.dart';
import 'package:to_do_app/core/design_system/theme/app_typography.dart';
import 'package:to_do_app/core/design_system/widgets/buttons/primary_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Typography("Welcome to"),
            Typography("TodoApp", color: AppColors.dartBrand),
          ],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 30),
                Image.asset(
                  "assets/images/login.png",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                CustomButton(
                  text: "Continue",
                  fontWeight: FontWeight.w600,
                  isFilled: true,
                  backgroundColor: AppColors.dartSuccess,
                  textColor: AppColors.backgroundNeutral,
                  onPressed: () async {},
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Container(height: 1, color: AppColors.lineNeutral),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ), // 👈 khoảng cách hai bên
                      child: Typography(
                        "or continue with",
                        color: AppColors.secondaryNeutral,
                        size: 12,
                      ),
                    ),
                    Expanded(
                      child: Container(height: 1, color: AppColors.lineNeutral),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: "Facebook",
                        isFilled: true,
                        icon: Icon(CupertinoIcons.flag_circle),
                        backgroundColor: AppColors.buttonGray,
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: CustomButton(
                        text: "Google",
                        isFilled: true,
                        backgroundColor: AppColors.buttonGray,
                        icon: Icon(CupertinoIcons.globe),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
