import 'package:shared_preferences/shared_preferences.dart';

class OnboardingService {
  static const String onboardingKey = 'seen_onboarding';

  // Gọi khi user bấm "Get Started"
  static Future<void> setSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(onboardingKey, true);
  }

  // Gọi khi app khởi động
  static Future<bool> hasSeen() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool('seen_onboarding') ?? false;
    } catch (e) {
      return false;
    }
  }
}
