// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meditation/constant/constant.dart';

class UserInfoPage extends StatelessWidget {
  String? name;
  String? email;
  String? bdate;
  String? image;
  UserInfoPage({Key? key, this.image, this.name, this.email, this.bdate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        /// =================== Background Image ===================
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Home Screen.jpg'),
              fit: BoxFit.fill),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50.h, left: 15.w, right: 15.w),
              child: Row(
                children: [
                  /// =================== Back Icon ===================
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Icon(Icons.arrow_back_ios_new_rounded,
                          size: 20.sp, color: Constant.whiteColor),
                    ),
                  ),

                  /// =================== Information ===================
                  SizedBox(width: 95.w),
                  Text('Information',
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Constant.whiteColor)),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 50.h),
              child: Column(
                children: [
                  /// =================== User Image ===================
                  Container(
                    height: 210.h,
                    width: 210.h,
                    decoration: BoxDecoration(
                        color: Colors.cyan,
                        border: Border.all(
                            color: Colors.white,
                            width: 5.w,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(150)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(150),
                      child: Image.network(
                          image!.isNotEmpty
                              ? image!
                              : 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg',
                          fit: BoxFit.fill),
                    ),
                  ),

                  /// =================== User Name ===================
                  SizedBox(height: 20.h),
                  Text(
                    name!.isEmpty ? 'Mrugesha Chirag Garambha' : name!,
                    style: TextStyle(
                        color: Constant.whiteColor,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold),
                  ),

                  /// =================== User Email ===================
                  SizedBox(height: 20.h),
                  Text(
                    email!.isEmpty ? 'mrugeshavocsy@gmail.com' : email!,
                    style: TextStyle(
                        color: Constant.whiteColor,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold),
                  ),

                  /// =================== Date ===================
                  SizedBox(height: 20.h),
                  Text(
                    bdate!.isEmpty ? 'mrugeshavocsy@gmail.com' : bdate!,
                    style: TextStyle(
                        color: Constant.whiteColor,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
