import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meditation/Controller/fogotpass_controller.dart';
import 'package:meditation/services/localstorage/local_storage_services.dart';
import 'package:meditation/views/screens/Login%20screen/sign_in_screen.dart';
import 'package:meditation/views/utils/button_page.dart';
import 'package:meditation/views/utils/textwidget.dart';
import '../../../constant/constant.dart';

class ForgotPasswordPage
    extends StatefulWidget {
  @override
  _ForgotPasswordPageState
      createState() =>
          _ForgotPasswordPageState();
}

class _ForgotPasswordPageState
    extends State<ForgotPasswordPage> {
  final _forgotemailtext =
      TextEditingController();
  final _formKey =
      GlobalKey<FormState>();

  final ForgotController
      _forgotController =
      Get.put(ForgotController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          height: 812.h,
          width: 375.w,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                    "assets/images/Login.jpg",
                    fit: BoxFit.cover),
              ),
              // AppBar(backgroundColor: Colors.transparent,leading: BackButton(),),
              Padding(
                padding:
                    EdgeInsets.only(
                        left: 20.w,
                        right: 20.w),
                child:
                    SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .center,
                    children: [
                      SizedBox(
                        height: 60,
                      ),
                      Row(children: [
                        BackButton(
                          color: Colors
                              .white,
                        )
                      ]),
                      SizedBox(
                          height:
                              150.h),
                      Styles.regular(
                          "Meditation",
                          ff: 'regular',
                          fs: 50.sp,
                          c: Constant
                              .whiteColor),
                      SizedBox(
                          height: 7.h),
                      Column(
                        children: [
                          Text(
                            "Enter your email and we’ll send to you ",
                            style: TextStyle(
                                color: Constant
                                    .whiteColor,
                                fontSize:
                                    15.sp),
                          ),
                          Text(
                            "a new password.",
                            style: TextStyle(
                                color: Colors
                                    .white,
                                fontSize:
                                    15.sp),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: 35.h),
                      Padding(
                        padding: EdgeInsets
                            .only(
                                right: 31
                                    .w),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                                'assets/icons/email.svg',
                                height: 16
                                    .h,
                                width: 20
                                    .w),
                            SizedBox(
                                width: 14
                                    .w),
                            Text(
                              'Enter Email',
                              style: TextStyle(
                                  color: Colors
                                      .white,
                                  fontSize:
                                      15.sp),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          height: 11.h),
                      TextFieldModel(
                        controller:
                            _forgotemailtext,
                        password: false,
                        valid: (value) {
                          if (value!
                              .isEmpty) {
                            return 'Please Enter Email';
                          }
                          String
                              pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regex =
                              RegExp(
                                  pattern);
                          if (!regex
                              .hasMatch(
                                  value)) {
                            return 'Enter Valid Email';
                          } else {
                            return '';
                          }
                        },
                      ),
                      SizedBox(
                          height: 35.h),
                      InkWell(
                        onTap:
                            () async {
                          print(
                              'USER id === ');
                          var uid =
                              await LocalStorageServices
                                  .box
                                  .read(
                                      'uid');
                          print(
                              'USER id === $uid');
                          await _forgotController
                              .forgot(
                                  email:
                                      _forgotemailtext.text,
                                  id: 40)
                              .then((_) {
                            Get.to(() =>
                                SignInScreen());
                          });
                        },
                        child: ButtonPage(
                            title:
                                "Send"),
                      ),
                      SizedBox(
                          height:
                              293.h),
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

  snackBar({title, message}) {
    return Get.snackbar(title, message);
  }
}
