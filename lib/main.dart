import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/layouts/app_layout.dart';
import 'package:to_do_app/screens/login.dart';
import 'package:to_do_app/screens/onboarding.dart';
import 'package:to_do_app/services/onboarding_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static Future<bool> checkIfSeen() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('seen_onboarding') ?? false;
  }

  // This widget is the root of your application.
  @override
  /// Checks if the onboarding process has been seen by the user.
  ///
  /// Returns a [Future] that resolves to `true` if the onboarding has been
  /// seen, otherwise `false`.
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool>(
        future: OnboardingService.hasSeen(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CupertinoActivityIndicator();
          }
          final seen = snapshot.data!;
          return seen ? LoginPage() : OnboardingPage();
        },
      ),
    );
  }
}
