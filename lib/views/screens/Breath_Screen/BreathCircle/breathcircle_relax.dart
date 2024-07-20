import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meditation/views/utils/textwidget.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import '../../../../Constant/constant.dart';
import 'customTimerPainter.dart';

class RelaxBreathCircle extends StatefulWidget {
  final String? time;
  final Duration? duration;
  RelaxBreathCircle({Key? key, this.time, this.duration}) : super(key: key);

  @override
  State<RelaxBreathCircle> createState() => _RelaxBreathCircleState();
}

class _RelaxBreathCircleState extends State<RelaxBreathCircle>
    with TickerProviderStateMixin {
  StopWatchTimer _stopWatchTimerBreathCircle =
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

  RxBool inhaleExhale = true.obs;

  @override
  void initState() {
    super.initState();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    if (widget.duration != null) {
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
    // _stopWatchTimerBreathCircle = StopWatchTimer();
    iconPath = '';
  }

  String displayText = 'Start Breathing';
  String iconPath = '';

  void startBreathingCycle() {
    setState(() {
      displayText =
          inhaleExhale.value ? 'Inhale 4 Seconds' : 'Exhale 6 Seconds';
      iconPath = inhaleExhale.value
          ? 'assets/icons/relax1.svg'
          : 'assets/icons/relax2.svg';
    });

    _timer = Timer(Duration(seconds: inhaleExhale.value ? 4 : 6), () {
      setState(() {
        inhaleExhale.value =
            !inhaleExhale.value; // Toggle between inhale and exhale
      });
      startBreathingCycle(); // Start the next phase of the cycle
    });
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
                              _stopTimer();
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
                  SizedBox(height: 20.0.h),
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
                                          color: Colors.white.withOpacity(0.4),
                                          blurRadius: 15))),
                              width: 180,
                              height: 180,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
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
                        iconPath = '';
                      }
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
