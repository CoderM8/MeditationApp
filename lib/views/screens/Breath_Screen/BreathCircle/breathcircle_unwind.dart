import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meditation/views/utils/textwidget.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import '../../../../Constant/constant.dart';
import 'customTimerPainter.dart';

class UnwindBreathCircle extends StatefulWidget {
  final String? time;
  final Duration? duration;

  UnwindBreathCircle({Key? key, this.time, this.duration}) : super(key: key);

  @override
  State<UnwindBreathCircle> createState() => _UnwindBreathCircleState();
}

class _UnwindBreathCircleState extends State<UnwindBreathCircle>
    with TickerProviderStateMixin {
  final StopWatchTimer _stopWatchTimerBreathCircle =
      StopWatchTimer(mode: StopWatchMode.countDown);
  late AnimationController controller;
  Timer? _timer;

  int timerAnimationCount(String time) {
    if (time.contains('1')) {
      return 60;
    } else if (time.contains('2')) {
      return 120;
    } else {
      return 240;
    }
  }

  RxInt inhaleExhale = 0.obs;

  @override
  void initState() {
    super.initState();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    if (widget.duration != null &&
        _stopWatchTimerBreathCircle.isRunning == false) {
      _stopWatchTimerBreathCircle
          .setPresetSecondTime(widget.duration!.inSeconds);
      controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: widget.duration!.inSeconds),
      );
    } else {
      _stopWatchTimerBreathCircle
          .setPresetMinuteTime(int.parse(widget.time ?? ''));
      controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: timerAnimationCount(widget.time ?? '')),
      );
    }
  }

  String displayText = 'Start Breathing';
  String iconPath = '';
  int getTimerBreathing(int i) {
    if (i == 0) {
      return 4;
    } else if (i == 1) {
      return 7;
    } else {
      return 8;
    }
  }

  void startBreathingCycle() {
    setState(() {
      if (inhaleExhale.value == 0) {
        displayText = 'Inhale 4 Seconds';
        iconPath = 'assets/icons/relax1.svg';
      } else if (inhaleExhale.value == 1) {
        displayText = 'Exhale 7 Seconds';
        iconPath = 'assets/icons/relax2.svg';
      } else {
        displayText = 'Inhale 8 Seconds';
        iconPath = 'assets/icons/relax1.svg';
      }
    });

    _timer =
        Timer(Duration(seconds: getTimerBreathing(inhaleExhale.value)), () {
      setState(() {
        if (inhaleExhale.value == 0) {
          inhaleExhale.value = 1;
        } else if (inhaleExhale.value == 1) {
          inhaleExhale.value = 2;
        } else if (inhaleExhale.value == 2) {
          inhaleExhale.value = 0;
        }
      });
      startBreathingCycle(); // Start the next phase of the cycle
    });
  }

  @override
  void dispose() async {
    super.dispose();
  }

  void _stopTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _stopWatchTimerBreathCircle.clearPresetTime();
        return true;
      },
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  child: SvgPicture.asset('assets/images/Breath.svg',
                      fit: BoxFit.cover),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40.0.h,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                        ),
                        child: InkWell(
                            onTap: () {
                              _stopWatchTimerBreathCircle.clearPresetTime();
                              Get.back();
                            },
                            child: SvgPicture.asset(
                                "assets/icons/backbutton.svg")),
                      ),
                      SizedBox(width: 98),
                      Center(
                          child: Styles.regular("Breath",
                              c: Constant.whiteColor, fs: 24.sp)),
                    ],
                  ),
                  SizedBox(height: 104),
                  SizedBox(
                    height: 300,
                    width: 300,
                    child: AnimatedBuilder(
                      animation: controller,
                      builder: (BuildContext context, Widget? child) {
                        return CustomPaint(
                            child: Center(
                                child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF06576A),
                                  boxShadow: List.generate(
                                      3,
                                      (index) => BoxShadow(
                                          color: Colors.white,
                                          blurRadius: 15))),
                              width: 180,
                              height: 180,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  iconPath.isEmpty
                                      ? SizedBox()
                                      : SvgPicture.asset(
                                          iconPath,
                                          height: 25,
                                          width: 25,
                                        ),
                                  Text(
                                    textAlign: TextAlign.center,
                                    displayText,
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                            painter: CustomTimerPainter(
                              animation: controller,
                              backgroundColor:
                                  Color(0xFF06576A).withOpacity(0.6),
                              color: Colors.cyanAccent,
                            ));
                      },
                    ),
                  ),
                  SizedBox(height: 60.h),
                  StreamBuilder<int>(
                    stream: _stopWatchTimerBreathCircle.rawTime,
                    initialData: 0,
                    builder: (context, snap) {
                      if (_stopWatchTimerBreathCircle.secondTime.value == 0) {
                        _stopTimer();
                        // displayText = 'Completed';
                      }
                      print('controller value : ${controller.value}');
                      final value = snap.data;
                      final displayTime = StopWatchTimer.getDisplayTime(value!,
                          milliSecond: false, hours: false);
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          displayTime,
                          style: TextStyle(
                            color: Constant.whiteColor,
                            fontSize: 40,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 84.h),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_stopWatchTimerBreathCircle.isRunning == true ||
                                _stopWatchTimerBreathCircle.secondTime.value ==
                                    0) {
                              _stopWatchTimerBreathCircle.onStopTimer();
                              controller.stop();
                              _stopTimer();
                            } else {
                              _stopWatchTimerBreathCircle.onStartTimer();
                              controller.reverse(
                                  from: controller.value == 0.0
                                      ? 1.0
                                      : controller.value);
                              startBreathingCycle();
                            }
                          });
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Container(
                              height: 66.h,
                              width: 66.w,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('assets/icons/circle.png'),
                                ),
                              ),
                            ),
                            SvgPicture.asset(
                                _stopWatchTimerBreathCircle.isRunning
                                    ? 'assets/icons/pause.svg'
                                    : 'assets/icons/play.svg',
                                height: 22.85.h,
                                width: 17.77.w),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
