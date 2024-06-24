import 'package:flutter/material.dart';
import 'package:my_movie/authentication/login_auth_function.dart';
import 'package:my_movie/utilities/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_movie/authentication/form_field.dart';


class CommonAuthPage extends StatefulWidget {
  final bool showName;
  final bool showConfirmPassword;
  final String text1;
  final String text2;
  final String subtext1;
  final String subtext2;

  const CommonAuthPage({
    Key? key,
    required this.text1,
    required this.text2,
    required this.subtext1,
    required this.subtext2,
    this.showConfirmPassword = false,
    this.showName = false,
  }) : super(key: key);
  @override
  State<CommonAuthPage> createState() => CommonAuthPageState();
}

class CommonAuthPageState extends State<CommonAuthPage> {
  final _formkey = GlobalKey<FormState>();
  bool isLogin = false;
  String? email;
  String? password;
  String? username;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


  bool obscureText = true;
  bool obscureConfirmPassword = true;
  void toggleObscureText() {
    setState(() {
      obscureText = !obscureText; // Toggle
    });
  }

  String? _validatePasswordConfirmation(String? value) {
    String passwordValue = passwordController.text;
    String confirmPasswordValue = confirmPasswordController.text;

    if (passwordValue != confirmPasswordValue) {
      return 'Passwords don\'t match';
    }
    return null;
  }

  String? emailValidator(String? value) {
    if (!(value.toString().contains('@'))) {
      return ErrorMessages.invalidEmail;
    } else {
      return null;
    }
  }
  String? passwordValidator(String? value) {
    if (value == null || value.length < 6) {
      return 'Password is too short';
    }
    return null;
  }

  String? nameValidator(String? value) {
    if (value.toString().isEmpty) {
      return 'Enter Username';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            //username
            if (!isLogin && widget.showName)
              FormFields(text: 'Name', icons: Icons.supervised_user_circle_rounded, valueKeyText: 'Name', validator:nameValidator,),
            ksizedbox,

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
                            if (value
                                .toString()
                                .length < 6) {
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

            //confirmPassword
            if (widget.showConfirmPassword)
              Column(
                children: <Widget>[
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Confirm Password',
                      style: TextStyle(
                        color: Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.0,
                        color: Colors.grey,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(6.0),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        const Icon(
                          Icons.lock,
                          color: Color.fromARGB(255, 96, 96, 96),
                        ),
                        const SizedBox(width: 5.0),
                        Container(
                          color: Colors.grey,
                          width: 1.0,
                          height: 41.0,
                        ),
                        Expanded(
                          child: TextFormField(
                            key: const ValueKey('ConfirmPassword'),
                            obscureText: obscureConfirmPassword,
                            validator: _validatePasswordConfirmation,
                            controller: confirmPasswordController,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                obscureConfirmPassword = !obscureConfirmPassword;
                              });
                            },
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
                  if (email != null && password != null) {
                    isLogin ? signin(email!, password!) : signup(email!, password!);
                  }

                }
              },
              child: isLogin
                  ? Text(widget.text1!)
                  : Text(
                      widget.text2!,
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
              },
              child: isLogin
                  ? Text(widget.subtext1!)
                  : Text(
                      widget.subtext2!,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
