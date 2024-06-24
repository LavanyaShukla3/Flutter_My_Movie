import 'package:flutter/material.dart';
import 'package:my_movie/authentication/common_auth.dart';
import 'package:my_movie/utilities/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_movie/movie_db/movie_homepage.dart';

class WelcomePage extends StatefulWidget {
  final String text;
  final bool confirmPassword;
  final bool name;

  const WelcomePage({Key? key,required this.text, required this.confirmPassword, required this.name,}): super(key: key);

  @override
  WelcomePageState createState() => WelcomePageState();
}

class WelcomePageState extends State<WelcomePage> {


  @override
  Widget build(BuildContext context) {

      return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 60.sp, left: 8.sp),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      widget.text,
                      style: textTheme.headlineMedium,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: <Widget>[
                      Text('Welcome to', style: TextStyle(fontSize: 22.sp)),
                      const SizedBox(width: 4.0),
                      Text(
                        'MyMovieList',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 22.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50.0),
          CommonAuthPage(
            showConfirmPassword: widget.confirmPassword,
            text1: 'LOGIN',
            text2: 'REGISTER',
            subtext1: "Don't have an account? Sign Up",
            subtext2: "Already have an account?",
            showName: widget.name,
          ),
        ],
      ),
    );
    }
  }
