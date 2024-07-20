import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meditation/views/utils/textwidget.dart';

import '../../Services/authentication_services/BaseNetworkApi.dart';
import '../../constant/constant.dart';
import '../../services/local_storage_service.dart';
import 'Sliderreminderchoosepage.dart';
import 'bottomnavigationbar/bottom_navigator.dart';

class SliderReminderTimePage extends StatefulWidget {
  final String? id;

  SliderReminderTimePage({
    Key? key,
    this.id,
  }) : super(key: key);

  @override
  State<SliderReminderTimePage> createState() => _SliderReminderTimePageState();
}

class _SliderReminderTimePageState extends State<SliderReminderTimePage> {
  Color colors = Constant.whiteColor;
  DateTime? _currentHour;

  @override
  void initState() {
    _currentHour = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                child: Image.asset("assets/images/Home Screen.jpg",
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              // height: Get.height,
              // width:Get.width,
              child: Padding(
                padding: EdgeInsets.only(left: 30.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.h),
                    InkWell(
                      onTap: () {
                        Get.back();
                        // print('hello test');
                      },
                      child: SvgPicture.asset('assets/icons/close.svg',
                          height: 22.h, width: 22.w),
                    ),
                    SizedBox(height: 20.h),
                    Styles.regular("When?",
                        fw: FontWeight.bold, fs: 25.sp, c: Constant.whiteColor),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: CupertinoTheme(
                data: CupertinoThemeData(brightness: Brightness.dark),
                child: CupertinoDatePicker(
                  use24hFormat: false,
                  itemExtent: 70,
                  // backgroundColor: Colors.white,
                  mode: CupertinoDatePickerMode.time,
                  minuteInterval: 1,
                  initialDateTime: _currentHour
                      ?.add(Duration(minutes: 15 - _currentHour!.minute % 15)),
                  onDateTimeChanged: (startTime) {
                    setState(
                      () {
                        _currentHour = startTime;
                      },
                    );
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 90,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: Row(
                  children: [
                    Spacer(
                      flex: 4,
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset('assets/icons/Groupleftaero.svg',
                          height: 90, width: 90),
                    ),
                    SizedBox(width: 7.w),
                    // Spacer(),
                    StreamBuilder<List<String>>(
                        stream: selectedDays.stream,
                        builder: (context, snapshot) {
                          return InkWell(
                            onTap: () async {
                              print('selectedDays :: $selectedDays');
                              var response = await BaseNetworkApi().apiPost(
                                  body:
                                      '{"method_name":"reminder","user_id":${LocalStorageServices().box.read('uid')},"reminder_day":${jsonEncode(selectedDays)},"reminder_time":"${_currentHour?.hour}:${_currentHour?.minute}"}');
                              if (response != null) {
                                print('response :: $response');
                                Get.to(() => BottomNavigator());
                              } else {
                                Get.snackbar(
                                    'AUTHENTICATION ERROR', 'SOMTHING WRONG');
                              }
                            },
                            child: SvgPicture.asset(
                                'assets/icons/Groupright.svg',
                                height: 90,
                                width: 90),
                          );
                        }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
