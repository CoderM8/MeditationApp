import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../Constant/constant.dart';
import '../views/utils/button_page.dart';
import '../views/utils/textwidget.dart';
import 'HomeScreen.dart';
import 'Loginpage.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({Key? key}) : super(key: key);

  @override
  _SignuppageState createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  final _emailtext = TextEditingController();
  final _pass = TextEditingController();
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
                        height: 109.h,
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
                        child: Column(
                          children: [
                            Text(
                              "Create an account to save ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                              ),
                            ),
                            Text(
                              " your progress",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 27.h,
                      ),
                      TextFieldModel(
                        password: false,
                        svg: "assets/icons/Group 262.svg",
                        hint: "Enter name",
                        height: 20.h,
                        width: 14.76.w,
                      ),
                      SizedBox(
                        height: 17.h,
                      ),
                      TextFieldModel(
                        controller: _emailtext,
                        svg: "assets/icons/email.svg",
                        hint: "Enter Email",
                        height: 20.h,
                        width: 16.w,
                        password: false,
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
                        height: 17.h,
                      ),
                      TextFieldModel(
                        svg: "assets/icons/Vector lok.svg",
                        hint: "Enter Password",
                        height: 20.h,
                        width: 16.w,
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
                      ),
                      SizedBox(
                        height: 17.h,
                      ),
                      TextFieldModel(
                        svg: "assets/icons/Vector lok.svg",
                        hint: "Conform Password",
                        height: 20.h,
                        width: 16.w,
                        password: false,
                      ),
                      SizedBox(
                        height: 27.h,
                      ),
                      GestureDetector(
                        onTap: () async {
                          Get.to(
                            () => Homescreen(),
                          );
                          if (_formKey.currentState!.validate()) {
                            snackbar(
                                title: 'susucfiuli',
                                message: 'Enter Your Email');
                          }
                        },
                        child: ButtonPage(title: "Sign up"),
                      ),
                      SizedBox(
                        height: 27.h,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/Line 1.svg',
                            width: 140.22.w,
                          ),
                          SizedBox(width: 7.w),
                          Text(
                            "OR",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          SvgPicture.asset(
                            'assets/icons/Line 1.svg',
                            width: 140.22.w,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextFieldPage(
                        svg: "assets/icons/Group 47.svg",
                        height: 20.h,
                        width: 20.w,
                        hint: "Continue with facebook",
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextFieldPage(
                        svg: "assets/icons/Group 50.svg",
                        height: 20.h,
                        width: 20.4.w,
                        hint: "Continue with Google",
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      GestureDetector(
                        onTap: () => Get.to(
                          Loginpage(),
                        ),
                        child: Styles.regular(
                          "Have an account? Log in",
                          fs: 16.sp,
                          c: Constant.whiteColor,
                        ),
                      ),
                      SizedBox(height: 40.h),
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
