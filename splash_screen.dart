import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_movie/movie_db/movie_homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Registeration_Page/register_main.dart';

class SplashScreen extends StatefulWidget {
  final SharedPreferences prefs;
  final bool hasPressedSkip;

  const SplashScreen({Key? key, required this.prefs, required this.hasPressedSkip})
      : super(key: key);

  static const String KEYLOGIN = "login";
  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    //to disable top bar and bottom bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    //to go to homepage
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) =>
              RegisterMain(
                prefs: widget.prefs,
                hasPressedSkip: widget.hasPressedSkip,
              ),
        ),
      );
    });
  }

  Future<void> whereToGo(BuildContext context) async {
    var sharedPref = await SharedPreferences.getInstance();
    //a static getter should be done using the class name
    var isLoggedIn = sharedPref.getBool(SplashScreen.KEYLOGIN);

    if (isLoggedIn == true) {
      // User is logged in, navigate to the home screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MovieHomepage(),
        ),
      );
    } else {
      // User is not logged in, navigate to the registration screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              RegisterMain(
                prefs: widget.prefs,
                hasPressedSkip: widget.hasPressedSkip,
              ),
        ),
      );
    }
  }

  @override
  void dispose() {
    //to disable it for other screens
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 56, 12, 12),
              Color.fromARGB(255, 184, 42, 42),
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            tileMode: TileMode.repeated,
          ),
        ),
        child: const Center(
          child: FractionallySizedBox(
            widthFactor: 0.4, // Adjust this value as needed
            child: Image(
              image: AssetImage('images/popcorn.png'),
            ),
          ),
        ),
      ),
    );
  }
}
