import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../views/utils/button_page.dart';
import '../views/utils/textwidget.dart';

class Forgotpasswordpage extends StatefulWidget {
  @override
  _ForgotpasswordpageState createState() => _ForgotpasswordpageState();
}

class _ForgotpasswordpageState extends State<Forgotpasswordpage> {
  // final _emailtext = TextEditingController();
  // bool _validate = false;
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
                        height: 230.h,
                      ),
                      Styles.regular(
                        "Meditation",
                        ff: 'regular',
                        fs: 50.sp,
                        c: Colors.white,
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Column(
                        children: [
                          Text(
                            "Enter your email and we’ll send to you ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.sp,
                            ),
                          ),
                          Text(
                            "a new password.",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          right: 31.w,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/email.svg',
                              height: 16.h,
                              width: 20.w,
                            ),
                            SizedBox(width: 14.w),
                            Text(
                              'Enter Email',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 11.h,
                      ),
                      TextFieldModel(
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
                        height: 35.h,
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            snackbar(
                                title: 'susucfiuli',
                                message: 'Enter  Your Email');
                          }
                        },
                        child: ButtonPage(title: "Send"),
                      ),
                      SizedBox(
                        height: 293.h,
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
