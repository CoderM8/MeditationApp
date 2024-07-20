import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:meditation/views/screens/Sliderremindetimepage.dart';
import 'package:meditation/views/utils/textwidget.dart';
import '../../constant/constant.dart';
import 'package:dio/dio.dart';

final dio = Dio();

class SliderReminderChoosePage extends StatefulWidget {
  final String? selectedId;
  SliderReminderChoosePage({Key? key, this.selectedId}) : super(key: key);

  @override
  State<SliderReminderChoosePage> createState() =>
      _SliderReminderChoosePageState();
}

RxList<String> selectedDays = <String>[].obs;

class _SliderReminderChoosePageState extends State<SliderReminderChoosePage> {
  bool selected = false;
  bool selectall = false;

  final List<String> items = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Firday',
    'Saturday'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              child: Image.asset("assets/images/Home Screen.jpg",
                  fit: BoxFit.cover),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 50.h),
              child: Container(
                height: 812.h,
                width: 375.w,
                child: Padding(
                  padding: EdgeInsets.only(left: 30.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30.h),
                      InkWell(
                        onTap: () {
                          // Get.to(DailyMeditationChoose());
                          Get.back();
                        },
                        child: SvgPicture.asset('assets/icons/close.svg',
                            height: 22.h, width: 22.w),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Styles.regular("Choose the day",
                              fw: FontWeight.bold,
                              fs: 25.sp,
                              c: Constant.whiteColor),
                          SizedBox(width: 71.w),
                          InkWell(
                            onTap: () {
                              selectedDays.clear();
                              setState(
                                () {
                                  selectall = !selectall;
                                  print(selectall);
                                  selectedDays.addAll(items);
                                },
                              );
                            },
                            child: Styles.regular("Select All",
                                fs: 16.sp, c: Constant.whiteColor),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.h),
                      Column(
                        children: [
                          Container(
                            height: 500.h,
                            width: 300.w,
                            child: ListView.builder(
                              itemCount: items.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return Selecteditem(
                                  title: items[index],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 30.w),
                            child: InkWell(
                              onTap: () async {
                                Get.to(() => SliderReminderTimePage(
                                      id: widget.selectedId,
                                    ));
                              },
                              child: SvgPicture.asset(
                                  'assets/images/sleep_forward.svg',
                                  height: 70.h,
                                  width: 70.w),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Selecteditem extends StatefulWidget {
  String title;

  Selecteditem({
    required this.title,
  });

  @override
  _SelecteditemState createState() => _SelecteditemState();
}

class _SelecteditemState extends State<Selecteditem> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<String>>(
        stream: selectedDays.stream,
        builder: (context, snapshot) {
          return ListTile(
            onTap: () {
              if (selectedDays.contains(widget.title)) {
                selectedDays.remove(widget.title);
              } else {
                selectedDays.add(widget.title);
              }
              print('selectedDays :: $selectedDays');
            },
            title: Text(
              widget.title,
              style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                  color: selectedDays.contains(widget.title)
                      ? Colors.white
                      : Colors.white10),
            ),
          );
        });
  }
}
