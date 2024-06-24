import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_movie/app_theme/app_theme_light.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_movie/splash_screen.dart';

main() async {
  // Ensure that Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await Firebase.initializeApp();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool hasPressedSkip = prefs.getBool('hasPressedSkip') ?? false;

  runApp(MyApp(prefs: prefs, hasPressedSkip: hasPressedSkip));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;
  final bool hasPressedSkip;

  const MyApp({Key? key, required this.prefs, required this.hasPressedSkip})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, widget) {

        return Builder(
          builder: (context) {
            // Call whereToGo function again to navigate

            return MaterialApp(
              theme: ThemeData.light().copyWith(
                primaryColor: AppThemeLight().colorPrimary,
                scaffoldBackgroundColor: AppThemeLight().colorSecondary,
              ),
              home: SplashScreen(prefs: prefs, hasPressedSkip: hasPressedSkip), // Set home as an empty SizedBox for now
            );
          },
        );
      },
    );
  }
}
