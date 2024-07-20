import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:meditation/views/utils/button_page.dart';

import '../Constant/constant.dart';
import '../views/utils/textwidget.dart';
import 'Forgotpasswordpage.dart';
import 'Signuppage.dart';

class Loginpage extends StatefulWidget {
  //const Loginpage({Key? key}) : super(key: key);

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _emailtext = TextEditingController();
  final _pass = TextEditingController();
  bool _validate = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        autovalidateMode: AutovalidateMode.always,
        key: _formKey,
        child: Container(
          height: 812.h,
          width: 375.w,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  "assets/images/Login.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 30.w,
                  right: 30.w,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 175.h,
                      ),
                      Styles.regular(
                        "Meditation",
                        ff: 'regular',
                        fs: 50.sp,
                        c: Colors.white,
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      Center(
                        child: Text(
                          "Log in to your account",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 34.h,
                      ),
                      TextFieldModel(
                        controller: _emailtext,
                        password: false,
                        svg: "assets/icons/email.svg",
                        width: 20.w,
                        height: 16.h,
                        hint: "Continue with facebook",
                        valid: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Email';
                          }
                          String pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regex = RegExp(pattern);
                          if (!regex.hasMatch(value)) {
                            return 'Enter Valid Email';
                          } else {
                            return '';
                          }
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextFieldModel(
                        controller: _pass,
                        password: true,
                        valid: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter a Password';
                          }
                          if (value.length <= 5) {
                            return 'Password is too short!';
                          }
                          return '';
                        },
                        svg: "assets/icons/Vector lok.svg",
                        width: 16.w,
                        height: 20.h,
                        hint: "Enter Password",
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () => Get.to(
                              Forgotpasswordpage(),
                            ),
                            child: Styles.regular(
                              "Forgot password?",
                              fs: 16.sp,
                              c: Constant.whiteColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 39.h,
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            snackbar(
                                title: 'susucfiuli',
                                message: 'Enter  Your Email');
                          }
                        },
                        child: ButtonPage(title: "Login"),
                      ),
                      SizedBox(
                        height: 51.h,
                      ),
                      Container(
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/Line 1.svg',
                              width: 140.w,
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            Text(
                              "OR",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            SvgPicture.asset(
                              'assets/icons/Line 1.svg',
                              width: 140.w,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextFieldPage(
                        svg: "assets/icons/Group 47.svg",
                        width: 20.w,
                        height: 20.h,
                        hint: "Continue with facebook",
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextFieldPage(
                        svg: "assets/icons/Group 50.svg",
                        width: 19.99.w,
                        height: 20.4.h,
                        hint: "Continue with Google",
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      GestureDetector(
                        onTap: () => Get.to(
                          () => Signuppage(
                            key: null,
                          ),
                        ),
                        child: Styles.regular(
                          "Nees an account? Sign up",
                          fs: 16.sp,
                          c: Constant.whiteColor,
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  snackbar({title, message}) {
    return Get.snackbar(title, message);
  }
}
