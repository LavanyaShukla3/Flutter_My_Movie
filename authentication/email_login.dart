import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_movie/utilities/constants.dart';
import 'package:my_movie/authentication/form_field.dart';
import 'package:my_movie/authentication/login_auth_function.dart';
import 'package:flutter/material.dart';
import 'package:my_movie/authentication/form_registeration.dart';

import '../movie_db/movie_homepage.dart';

class EmailLogin extends StatefulWidget {
  const EmailLogin({super.key});

  @override
  State<EmailLogin> createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {
  final _formkey = GlobalKey<FormState>();
  bool isLogin = false;
  String email = '';
  String password = '';
  String username = '';

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool obscureText = true;
  void toggleObscureText() {
    setState(() {
      obscureText = !obscureText; // Toggle
    });
  }


  String? emailValidator(String? value) {
    if (!(value.toString().contains('@'))) {
      return ErrorMessages.invalidEmail;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                      'Sign In',
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

          Form(
            key: _formkey,
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [


                  //email
                  FormFields(text: 'Email', icons: Icons.mail, valueKeyText: 'email', validator:emailValidator,),
                  ksizedbox,

                  //password
                  Column(
                    children: <Widget>[
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text('Password',
                            style: TextStyle(
                                color: Color.fromARGB(255, 96, 96, 96))),
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                            color: Colors.grey,
                          ),
                          borderRadius: const BorderRadius.all(
                              Radius.circular(6.0)),
                        ),
                        child: Row(
                          children: <Widget>[
                            const Icon(
                              Icons.lock,
                              color: Color.fromARGB(255, 96, 96, 96),
                            ),
                            const SizedBox(width: 5.0),
                            Container(
                                color: Colors.grey, width: 1.0, height: 41.0),
                            Container(color: Colors.grey, width: 5.0),
                            Expanded(
                              child: TextFormField(
                                key: const ValueKey('Password'),
                                obscureText: obscureText,
                                validator: (value) {
                                  if (value.toString().length < 6) {
                                    return 'Password is too short';
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (value) {
                                  setState(() {
                                    password = value!;
                                  });
                                },
                                controller: passwordController,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: GestureDetector(
                                onTap: toggleObscureText,
                                child: const Icon(
                                  Icons.remove_red_eye,
                                  color: Color.fromARGB(255, 96, 96, 96),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ksizedbox,

                  GestureDetector(
                    onTap: () {
                      // Save the form when all the fields are validated
                      if (_formkey.currentState!.validate()) {
                        _formkey.currentState!.save();
                          signup(email, password);
                          
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MovieHomepage(),),
                        );

                      }
                    },
                    child: isLogin
                        ? const Text('Login')
                        : Text('Signup',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                          fontSize: 22.sp),
                    ),
                  ),
                  ksizedbox,

                  TextButton(
                    onPressed: (){
                      setState(() {
                        isLogin = !isLogin;
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context) {return const RegisterationPage();
                      },),
                      );
                    },
                    child: isLogin
                        ? const Text("Don't have an account? Signup")
                        : const Text(
                      'Already Signed Up? Login',
                      style: TextStyle(
                        color: Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}


