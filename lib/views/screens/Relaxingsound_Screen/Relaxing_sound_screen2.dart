// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meditation/views/utils/textwidget.dart';

import '../Breathcircle_2.dart';
import 'Relaxing_sound_screen3.dart';

RxInt selectedIndex = 0.obs;

class RelaxingSoundSecond extends StatelessWidget {
  String? imageUrl;
  String? songUrl;

  RelaxingSoundSecond({Key? key, this.songUrl, this.imageUrl})
      : super(key: key);
  bool isSelected = false;
  String getMint(int index) {
    if (index == 0) {
      return '5';
    } else if (index == 1) {
      return '10';
    } else {
      return '20';
    }
  }

  @override
  Widget build(BuildContext context) {
    print('hello hoe are 11');
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Padding(
        padding: EdgeInsets.only(left: 35.0.w, right: 35.0.w),
        child: Column(
          children: [
            SizedBox(
              height: 21,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    child: SvgPicture.asset("assets/icons/breath6.svg",
                        height: 26, width: 26),
                  ),
                ),
              ],
            ),
            Styles.regular("Choose your duration", fs: 18.sp, c: Colors.white),
            SizedBox(height: 80.h),
            Container(
              height: 100,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: ChooseRound(
                      index: index,
                      isSelected: isSelected,
                      imageUrl: imageUrl,
                      songUrl: songUrl,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 40.h),
            StreamBuilder<int>(
                stream: selectedIndex.stream,
                builder: (context, snapshot) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Get.to(() => BreathCircleSecond(
                            imageUrl: imageUrl,
                            songUrl: songUrl,
                            time: getMint(selectedIndex.value),
                          ));
                    },
                    child: Container(
                      height: 53.h,
                      alignment: Alignment.center,
                      width: 253.w,
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(26.5.r)),
                      child: Styles.regular("Start Session",
                          fs: 18.sp, c: Colors.white, al: TextAlign.center),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class ChooseRound extends StatefulWidget {
  String? imageUrl;
  String? songUrl;
  ChooseRound(
      {Key? key,
      this.isSelected = false,
      this.index,
      this.imageUrl,
      this.songUrl})
      : super(key: key);
  bool isSelected;

  int? index;

  @override
  _ChooseRoundState createState() => _ChooseRoundState();
}

class _ChooseRoundState extends State<ChooseRound> {
  List<String> time = [
    '5 min',
    '10 min',
    '20 min',
  ];
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        print('INDEX == ${widget.index}');
        selectedIndex.value = widget.index ?? 0;
        if (widget.index == 3) {
          print('INDEX == IN');
          Navigator.pop(context);
          showModalBottomSheet(
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
            backgroundColor: Color(0xFF002D38),
            context: context,
            builder: (context) {
              return RelaxingSoundThree(
                imageUrl: widget.imageUrl,
                songUrl: widget.songUrl,
              );
            },
          );
        }
        setState(
          () {
            widget.isSelected = !widget.isSelected;
          },
        );
      },
      child: StreamBuilder<int>(
          stream: selectedIndex.stream,
          builder: (context, snapshot) {
            return Container(
              height: 65.h,
              width: 65.w,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff06576A).withOpacity(0.7),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 20,
                        spreadRadius: 10,
                        offset: Offset(0, 3)),
                  ],
                  border: Border.all(
                      color: selectedIndex.value == widget.index
                          ? Colors.white
                          : Colors.transparent,
                      width: 2)),
              child: widget.index == 3
                  ? Center(
                      child: Icon(Icons.add, color: Colors.white, size: 30),
                    )
                  : Container(
                      width: 70.w,
                      height: 50.h,
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          time[widget.index ?? 0],
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ),
            );
          }),
    );
  }
}
