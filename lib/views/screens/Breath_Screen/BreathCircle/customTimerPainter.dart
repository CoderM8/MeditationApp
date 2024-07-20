import 'dart:math' as math;
import 'package:flutter/material.dart';

// class BreathCircle extends StatefulWidget {
//  final String ?time;
//  final Duration ?duration;
//    BreathCircle({Key? key,this.time,this.duration}) : super(key: key);
//
//   @override
//   State<BreathCircle> createState() => _BreathCircleState();
// }
//
// class _BreathCircleState extends State<BreathCircle> with TickerProviderStateMixin {
//   final StopWatchTimer _stopWatchTimerBreathCircle = StopWatchTimer(mode: StopWatchMode.countDown);
//   late AnimationController controller;
//   Timer? _timer;
//   int timerAnimationCount(String time) {
//     if(time.contains('1')){
//       return 60;
//     }
//     else if (time.contains('2')){
//       return 120;
//     }else{
//       return 240;
//     }
//  }
//
//   RxBool inhaleExhale = true.obs;
//
//   @override
//   void initState() {
//     super.initState();
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
//     if( widget.duration != null){
//       _stopWatchTimerBreathCircle.setPresetSecondTime(widget.duration!.inSeconds);
//       controller = AnimationController(
//         vsync: this,
//         duration: Duration(seconds: widget.duration!.inSeconds),
//       );
//     }else{
//       _stopWatchTimerBreathCircle.setPresetMinuteTime(int.parse(widget.time??''));
//       controller = AnimationController(
//         vsync: this,
//         duration: Duration(seconds: timerAnimationCount(widget.time ?? '')),
//       );
//     }
//   }
//
//   String displayText = 'Start Breathing';
//
//   void startBreathingCycle() {
//     setState(() {
//       displayText = inhaleExhale.value ? 'Inhale 4 Seconds' : 'Exhale 6 Seconds';
//     });
//
//    _timer = Timer(Duration(seconds: inhaleExhale.value ? 4 : 6), () {
//       setState(() {
//         inhaleExhale.value = !inhaleExhale.value; // Toggle between inhale and exhale
//       });
//       startBreathingCycle(); // Start the next phase of the cycle
//     });
//   }
//
//   @override
//   void dispose() async {
//     await _stopWatchTimerBreathCircle.dispose();
//     super.dispose();
//   }
//   void _stopTimer() {
//     if (_timer != null && _timer!.isActive) {
//       _timer!.cancel();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             child: Stack(
//               children: [
//                 Positioned.fill(
//                   child: Container(
//                     child: SvgPicture.asset('assets/images/Breath.svg', fit: BoxFit.cover),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 30.0, top: 30),
//                   child: Column(
//                     children: [
//                       InkWell(
//                     onTap: () {
//                       dispose();
//                       Get.back();
//                     },
//                     child: Row(
//                       children: [
//                         SvgPicture.asset("assets/icons/backbutton.svg"),
//                             SizedBox(width: 98),
//                             Center(child: Styles.regular("Breath", c: Constant.whiteColor, fs: 24.sp)),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 104),
//                   SizedBox(
//                     height: 300,
//                     width: 300,
//                     child: AnimatedBuilder(
//                       animation: controller,
//                       builder: (BuildContext context, Widget? child) {
//                         return CustomPaint(
//                             child: Center(
//                                 child: Container(
//                               alignment: Alignment.center,
//                               decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Color(0xFF06576A),
//                                   boxShadow: List.generate(3, (index) => BoxShadow(color: Colors.white, blurRadius: 15))),
//                               width: 180,
//                               height: 180,
//                               child: Text(
//                                 textAlign: TextAlign.center,
//                                 displayText,
//                                 style: TextStyle(
//                                   fontSize: 25,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             )),
//                             painter: CustomTimerPainter(
//                               animation: controller,
//                               backgroundColor: Color(0xFF06576A).withOpacity(0.6),
//                               color: Colors.cyanAccent,
//                             ));
//                       },
//                     ),
//                   ),
//                   SizedBox(height: 60.h),
//                   StreamBuilder<int>(
//                     stream: _stopWatchTimerBreathCircle.rawTime,
//                         initialData: 0,
//                         builder: (context, snap) {
//                           if(_stopWatchTimerBreathCircle.secondTime.value == 0){
//                             _stopTimer();
//                             displayText  = 'Completed';
//                           }
//                           final value = snap.data;
//                       final displayTime = StopWatchTimer.getDisplayTime(value!, milliSecond: false, hours: false);
//                       return Padding(
//                         padding: const EdgeInsets.all(8),
//                         child: Text(
//                               displayTime,
//                               style: TextStyle(
//                                 color: Constant.whiteColor,
//                                 fontSize: 40,
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                       SizedBox(height: 84.h),
//                       Column(
//                         children: [
//                       GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             if (_stopWatchTimerBreathCircle.isRunning == true || _stopWatchTimerBreathCircle.secondTime.value == 0) {
//                               _stopWatchTimerBreathCircle.onStopTimer();
//                               controller.stop();
//                               _stopTimer();
//                             } else {
//                               _stopWatchTimerBreathCircle.onStartTimer();
//                               controller.reverse(from: controller.value == 0.0 ? 1.0 : controller.value);
//                               startBreathingCycle();
//                             }
//                           });
//                         },
//                         child: Stack(
//                           alignment: Alignment.center,
//                           children: <Widget>[
//                             Container(
//                               height: 66.h,
//                               width: 66.w,
//                               decoration: const BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 image: DecorationImage(
//                                   fit: BoxFit.fill,
//                                   image: AssetImage('assets/icons/circle.png'),
//                                 ),
//                               ),
//                             ),
//                             SvgPicture.asset(_stopWatchTimerBreathCircle.isRunning ? 'assets/icons/pause.svg' : 'assets/icons/play.svg',
//                                 height: 22.85.h, width: 17.77.w),
//                           ],
//                         ),
//                       ),
//                     ],),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//     );
//   }
// }

class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter({
    required this.animation,
    required this.backgroundColor,
    required this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true
      ..color = backgroundColor
      ..strokeWidth = 12.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(size.center(Offset.zero), size.width / 2, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, progress, false, paint);
  }

  @override
  bool shouldRepaint(CustomTimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
