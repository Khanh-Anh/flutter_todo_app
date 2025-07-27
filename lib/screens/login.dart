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
            SizedBox(width: 4),
            Typography("TodoApp", color: AppColors.dartBrand),
          ],
        ),
      ),
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 32),
                          Image.asset(
                            "assets/images/login.png",
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 32),
                        ],
                      ),

                      // Phần cuối trang
                      Column(
                        children: [
                          CustomButton(
                            text: "Continue",
                            fontWeight: FontWeight.w600,
                            isFilled: true,
                            backgroundColor: AppColors.dartSuccess,
                            textColor: AppColors.backgroundNeutral,
                            onPressed: () async {},
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: AppColors.lineNeutral,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                ),
                                child: Typography(
                                  "or continue with",
                                  color: AppColors.secondaryNeutral,
                                  size: 12,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: AppColors.lineNeutral,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
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
                          const SizedBox(height: 30),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
