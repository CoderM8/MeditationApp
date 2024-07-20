import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'EditProfilepage.dart';

class Changepasspage extends StatelessWidget {
  Changepasspage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              child: Image.asset(
                "assets/images/Home Screen.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: 812.h,
              width: 375.w,
              child: Column(
                children: [
                  SizedBox(height: 33.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return EditProfilepage();
                                },
                              ),
                            );
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        SizedBox(width: 23.w),
                        texttitle('Change your password')
                      ],
                    ),
                  ),
                  SizedBox(height: 64.h),
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            hoverColor: Colors.white,
                            hintText: 'Enter your current password',
                            hintStyle: TextStyle(color: Colors.white),
                            labelText: 'Current password',
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                          inputFormatters: [
                            new LengthLimitingTextInputFormatter(10)
                          ],
                          // validator: (value) {
                          //   if (value!.isEmpty) {
                          //     return 'Please enter password';
                          //   }
                          //   return null;
                          // },
                          // onSaved: (value) {
                          //   // user.name = value!;
                          // },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Enter your new password',
                            hintStyle: TextStyle(color: Colors.white),
                            labelText: 'New password',
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          // validator: (value) {
                          //   if (!emailRegex.hasMatch(value!)) {
                          //     return 'Please enter valid email';
                          //   }
                          //   return null;
                          // },
                          // onSaved: (value) {
                          //   //user.email = value!;
                          // },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            // icon: const Icon(
                            //   Icons.calendar_today_outlined,
                            //   color: Colors.white,
                            // ),
                            hintText: 'Enter confirm password',
                            hintStyle: TextStyle(color: Colors.white),
                            labelText: 'confirm password',
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                          inputFormatters: [
                            new LengthLimitingTextInputFormatter(10)
                          ],
                          // validator: (value) {
                          //   if (value!.isEmpty) {
                          //     return 'Please enter name';
                          //   }
                          //   return null;
                          // },
                          // onSaved: (value) {
                          //   // user.name = value!;
                          // },
                        ),
                        SizedBox(
                          height: 56.h,
                        ),
                        GestureDetector(
                            onTap: () {
                              print("123456");
                              Changepasspage();
                            },
                            child: Container(
                              width: 333.w,
                              height: 49.h,
                              //  color: Colors.white10,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.white10),
                              child: Align(
                                child: Text(
                                  " UPDATE",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                alignment: Alignment.center,
                              ),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  final RegExp phoneRegex = new RegExp(r'^[6-9]\d{9}$');
  final RegExp emailRegex = new RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

  Widget texttitle(String title) {
    return Text(
      title,
      style: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
