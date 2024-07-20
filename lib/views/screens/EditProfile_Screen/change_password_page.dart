// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meditation/Controller/profile_controller.dart';
import '../../../constant/image_constant.dart';
import '../../../constant/constant.dart';
import '../../../generated/l10n.dart';
import 'edit_profile_page.dart';

class ChangePasswordPage extends StatelessWidget {
  String? name;
  String? email;
  DateTime? bDate;
  String? image;
  ChangePasswordPage({Key? key, this.name, this.email, this.bDate, this.image})
      : super(key: key);
  TextEditingController current = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      body: Stack(
        children: [
          /// =================== Background Image ===================
          Positioned.fill(
            child: Container(
              child: Image.asset(backgroundImage, fit: BoxFit.cover),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: Container(
                height: 812.h,
                width: 375.w,
                child: Column(
                  children: [
                    SizedBox(height: 33.h),
                    Padding(
                      padding: EdgeInsets.only(left: 30.0.w),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return EditProfilePage(
                                      bDate: bDate,
                                      name: name,
                                      email: email,
                                      image: image,
                                    );
                                  },
                                ),
                              );
                            },
                            child: Icon(Icons.arrow_back,
                                color: Constant.whiteColor, size: 24.sp),
                          ),

                          /// =================== Change Your Password ===================
                          SizedBox(width: 23.w),
                          textTitle(S.of(context).changeYourPassword),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Padding(
                      padding: EdgeInsets.all(40.0.w.h),
                      child: Column(
                        children: [
                          /// =================== Current Password ===================
                          TextFormField(
                            controller: current,
                            decoration: InputDecoration(
                              fillColor: Constant.whiteColor,
                              hoverColor: Constant.whiteColor,
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Constant.whiteColor),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Constant.whiteColor),
                              ),
                              hintText: 'Enter your current password',
                              hintStyle: TextStyle(color: Constant.whiteColor),
                              labelText: 'Current password',
                              labelStyle: TextStyle(
                                  color: Constant.whiteColor,
                                  fontSize: 16.0.sp),
                            ),
                            style: TextStyle(color: Constant.whiteColor),
                            inputFormatters: [
                              new LengthLimitingTextInputFormatter(10)
                            ],
                          ),

                          /// =================== New Password ===================
                          SizedBox(height: 20),
                          TextFormField(
                              controller: newPassword,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Constant.whiteColor),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Constant.whiteColor),
                                ),
                                hintText: 'Enter your new password',
                                hintStyle:
                                    TextStyle(color: Constant.whiteColor),
                                labelText: 'New password',
                                labelStyle: TextStyle(
                                    color: Constant.whiteColor, fontSize: 16.0),
                              ),
                              style: TextStyle(color: Constant.whiteColor),
                              keyboardType: TextInputType.emailAddress),

                          /// =================== Confirm Password ===================
                          SizedBox(height: 20),
                          TextFormField(
                            controller: confirmPassword,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Constant.whiteColor),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Constant.whiteColor),
                              ),
                              hintText: 'Enter confirm password',
                              hintStyle: TextStyle(color: Constant.whiteColor),
                              labelText: 'confirm password',
                              labelStyle: TextStyle(
                                  color: Constant.whiteColor, fontSize: 16.0),
                            ),
                            style: TextStyle(color: Constant.whiteColor),
                            inputFormatters: [
                              new LengthLimitingTextInputFormatter(10)
                            ],
                          ),

                          /// =================== Update Button ===================
                          SizedBox(height: 200.h),
                          InkWell(
                            onTap: () {
                              controller
                                  .changePass(
                                      newp: newPassword.text,
                                      current: current.text,
                                      confirm: confirmPassword.text)
                                  .then((value) {
                                Get.back();
                                Get.snackbar('Password Updated',
                                    value!.relaxMeditation[0].msg);
                              });
                            },
                            child: SizedBox(
                              width: 333.w,
                              height: 49.h,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: Colors.white10,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25))),
                                onPressed: () {},
                                child: Text(
                                  " UPDATE",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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

  Widget textTitle(String title) {
    return Text(
      title,
      style: TextStyle(
          color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.bold),
    );
  }
}
