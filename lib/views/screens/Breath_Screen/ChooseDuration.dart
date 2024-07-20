import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meditation/views/utils/textwidget.dart';
import '../../../constant/constant.dart';
import '../../../generated/l10n.dart';
import '../Utils.dart';

class ChooseDuration extends StatefulWidget {
  @override
  _ChooseDurationState createState() => _ChooseDurationState();
}

class _ChooseDurationState extends State<ChooseDuration> {
  late int pickeDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF002D38),
      body: SingleChildScrollView(
        child: Container(
          height: 543.h,
          width: 375.w,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Padding(
                      padding: const EdgeInsets.only(
                          left: 29.0, top: 24, right: 324),
                      child: Icon(Icons.arrow_back_rounded,
                          color: Constant.whiteColor, size: 15),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Column(
                children: [
                  Styles.regular("Choose your duration",
                      c: Constant.whiteColor, fs: 18),
                  SizedBox(height: 22),
                  PagePicker()
                ],
              ),
              SizedBox(height: 100.h),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 53.h,
                  width: 253.w,
                  decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(26.5.r)),
                  child: Padding(
                    padding: EdgeInsets.only(top: 18.h),
                    child: Styles.regular(S.of(context).startSession,
                        fs: 18, c: Colors.white, al: TextAlign.center),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PagePicker extends StatefulWidget {
  const PagePicker({Key? key}) : super(key: key);

  @override
  _PagePickerState createState() => _PagePickerState();
}

class _PagePickerState extends State<PagePicker> {
  int index = 0;

  static List<String> values = [
    '1 Minutes',
    '2 Minutes',
    '3 Minutes',
    '4 Minutes',
    '5 Minutes',
    '6 Minutes',
    '7 Minutes',
    '8 Minutes',
    '9 Minutes',
    '10 Minutes'
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildCustomPicker(),
        ],
      ),
    );
  }

  Widget buildCustomPicker() => SizedBox(
        height: 160.h,
        child: CupertinoPicker(
          backgroundColor: Color(0xFF002D38),
          itemExtent: 65,
          diameterRatio: 1.2,
          looping: true,
          onSelectedItemChanged: (index) => setState(() => this.index = index),
          selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
            background: Colors.teal.withOpacity(0.2),
          ),
          children: Utils.modelBuilder<String>(
            values,
            (index, value) {
              final isSelected = this.index == index;
              final color = isSelected ? Colors.white : Colors.grey;
              return Center(
                child: Text(
                  value,
                  style: TextStyle(color: color, fontSize: 24),
                ),
              );
            },
          ),
        ),
      );
}
