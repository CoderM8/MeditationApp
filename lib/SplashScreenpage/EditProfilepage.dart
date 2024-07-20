import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../views/utils/profile_Button_Widget.dart';
import 'Changepasspage.dart';
import 'bottom_navigator.dart';

class EditProfilepage extends StatelessWidget {
  EditProfilepage({Key? key}) : super(key: key);

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
                  SizedBox(height: 30.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return bottom_navigatorpage();
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
                        SizedBox(width: 54.w),
                        texttitle('Edit Your Profile')
                      ],
                    ),
                  ),
                  SizedBox(height: 18.h),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            // border: Border.all(
                            //     width: 1,
                            //     color: Theme.of(context).scaffoldBackgroundColor),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: Offset(0, 10))
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                'https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e03cfd8ce2855d217d157c93060da490&v=4',
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 1,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              color: Colors.white,
                            ),
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 41.h),
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            hoverColor: Colors.white,
                            icon: const Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            hintText: 'Enter your name',
                            hintStyle: TextStyle(color: Colors.white),
                            labelText: 'Name',
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                          inputFormatters: [
                            new LengthLimitingTextInputFormatter(10)
                          ],
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter name';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            // user.name = value!;
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.email, color: Colors.white),
                            hintText: 'Enter your email address',
                            hintStyle: TextStyle(color: Colors.white),
                            labelText: 'Email',
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (!emailRegex.hasMatch(value!)) {
                              return 'Please enter valid email';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            //user.email = value!;
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            icon: const Icon(
                              Icons.calendar_today_outlined,
                              color: Colors.white,
                            ),
                            hintText: 'Date of Birth',
                            hintStyle: TextStyle(color: Colors.white10),
                            labelText: 'Date of Birth',
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                          inputFormatters: [
                            new LengthLimitingTextInputFormatter(10)
                          ],
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter name';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            // user.name = value!;
                          },
                        ),
                        SizedBox(
                          height: 23.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return Changepasspage();
                                },
                              ),
                            );
                          },
                          child: ProfileButtonPage(
                            icon: Icons.lock,
                            height: 18.h,
                            width: 18.w,
                            hint: "Change your password",
                          ),
                        ),
                        SizedBox(
                          height: 76.h,
                        ),
                        Container(
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
                        )
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
