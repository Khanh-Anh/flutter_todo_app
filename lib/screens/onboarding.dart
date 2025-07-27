import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:to_do_app/core/design_system/theme/app_colors.dart';
import 'package:to_do_app/core/design_system/theme/app_typography.dart';
import 'package:to_do_app/core/design_system/widgets/buttons/primary_button.dart';
import 'package:to_do_app/layouts/app_layout.dart';
import 'package:to_do_app/services/onboarding_service.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingCupertinoState createState() => _OnboardingCupertinoState();
}

class _OnboardingCupertinoState extends State<OnboardingPage> {
  final PageController _controller = PageController(initialPage: 0);
  bool isLastPage = false;
  bool isFirstPage = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                isLastPage = index == 2;
                isFirstPage = index == 0;
              });
            },
            children: [
              buildPage(
                color: AppColors.defaultBrand,
                title: "Todyapp",
                subtitle: "The best to do list application for you",
                icon: CupertinoIcons.text_badge_checkmark,
              ),
              buildPage(
                color: AppColors.whiteNeutral,
                title: "Your convenience in making a todo list",
                subtitle:
                    "Here's a mobile platform that helps you create task "
                    'or to list so that it can help you in every job '
                    'easier and faster.',
              ),
              buildPage(
                color: AppColors.whiteNeutral,
                title: "Find the practicality in making your todo list",
                subtitle:
                    "Easy-to-understand user interface  that makes you "
                    "more comfortable when you want to create a task or "
                    "to do list, Todyapp can also improve productivity.",
              ),
            ],
          ),

          /// Skip button
          Visibility(
            visible: !isFirstPage,
            child: Positioned(
              top: 50,
              right: 20,
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                child: Typography(
                  'Skip',
                  color: AppColors.defaultBrand,
                  size: 16,
                  weight: FontWeight.w500,
                ),
                onPressed: () async {
                  await OnboardingService.setSeen();
                  if (context.mounted) {
                    Navigator.of(context).pushReplacement(
                      CupertinoPageRoute(builder: (_) => AppLayout()),
                    );
                  }
                },
              ),
            ),
          ),

          /// Indicator
          Positioned(
            bottom: 150,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: ExpandingDotsEffect(
                  activeDotColor: isFirstPage
                      ? AppColors.focusedSuccess
                      : AppColors.defaultBrand,
                  dotHeight: 10,
                  dotWidth: 10,
                  expansionFactor: 3,
                  dotColor: AppColors.focusedSuccess,
                ),
              ),
            ),
          ),
          Visibility(
            visible: !isFirstPage,
            child: Positioned(
              bottom: 40, // thấp hơn dot
              left: 30,
              right: 30,
              child: CustomButton(
                text: "Continue",
                width: double.infinity,
                fontWeight: FontWeight.w600,
                isFilled: true,
                backgroundColor: AppColors.dartSuccess,
                textColor: AppColors.backgroundNeutral,
                onPressed: () async {
                  if (_controller.page == 1) {
                    _controller.jumpToPage((_controller.page! + 1).round());
                    return;
                  }
                  await OnboardingService.setSeen();
                  if (context.mounted) {
                    Navigator.of(context).pushReplacement(
                      CupertinoPageRoute(builder: (_) => AppLayout()),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPage({
    required Color color,
    required String title,
    required String subtitle,
    IconData? icon,
  }) {
    return Container(
      color: color,
      padding: EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: !isFirstPage
            ? [
                Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/onboarding.png',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 0,
                      right: 0,
                      child: Typography(
                        title,
                        color: AppColors.primaryNeutral,
                        size: 26,
                        weight: FontWeight.bold,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Typography(
                  subtitle,
                  color: AppColors.secondaryNeutral,
                  size: 14,
                  weight: FontWeight.w500,
                  textAlign: TextAlign.center,
                  height: 1.5,
                ),
              ]
            : [
                Icon(icon, size: 100, color: AppColors.lineNeutral),
                SizedBox(height: 20),
                Typography(
                  title,
                  color: AppColors.lineNeutral,
                  size: 26,
                  weight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Typography(
                  subtitle,
                  color: AppColors.lineNeutral,
                  size: 14,
                  weight: FontWeight.w500,
                  textAlign: TextAlign.center,
                  height: 1.5,
                ),
              ],
      ),
    );
  }
}
