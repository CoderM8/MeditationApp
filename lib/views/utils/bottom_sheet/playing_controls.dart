// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constant/constant.dart';

class PlayingControlls extends StatelessWidget {
  final bool? isPlaying;
  final bool isPlaylist;
  final Function()? onPrevious;
  final Function()? onPlay;
  final Function()? onNext;
  final Function()? onStop;
  final Function()? forward;
  final Function()? rewind;
  int prihight;
  int priwidht;
  int nexthight;
  int nextwidth;
  int playhight;
  int playwidth;
  int icoprihight;
  int icopriwidht;
  int iconexthight;
  int iconextwidth;
  int icoplayhight;
  int icoplaywidth;
  int? iconStopHeight;
  int? iconStopWidth;
  int? iconStopSize;

  // final Function() onStop;

  PlayingControlls(
      {this.isPlaying,
      this.isPlaylist = false,
      this.onPrevious,
      this.onPlay,
      this.onNext,
      this.rewind,
      this.forward,
      this.iconStopHeight,
      this.iconStopWidth,
      this.iconStopSize,
      required this.prihight,
      required this.priwidht,
      required this.nexthight,
      required this.nextwidth,
      required this.playhight,
      required this.playwidth,
      required this.icoprihight,
      required this.icopriwidht,
      required this.iconexthight,
      required this.iconextwidth,
      required this.icoplayhight,
      required this.icoplaywidth,
      this.onStop
      // this.onStop,
      });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// =================== Rewind ===================
        Container(
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/icons/Group1.png'),
            ),
          ),
          child: Center(
            child: InkWell(
              onTap: rewind,
              child: buildContainer(
                  svg: 'assets/icons/backward.svg', imgw: 25.w, imgh: 25.h),
            ),
          ),
        ),
        // Stack(
        //   children: [
        //     Container(
        //       height: prihight.h,
        //       width: priwidht.w,
        //       decoration: const BoxDecoration(
        //         shape: BoxShape.circle,
        //         image: DecorationImage(
        //           fit: BoxFit.fill,
        //           image: AssetImage('assets/icons/Group1.png'),
        //         ),
        //       ),
        //       child: Center(
        //         child: InkWell(
        //           onTap: rewind,
        //           child: buildContainer(svg: 'assets/icons/backward.svg', imgw: icopriwidht.w, imgh: icoprihight.h),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),

        /// =================== Play ===================
        Container(
          height: playhight.h,
          width: playwidth.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/icons/Group1.png'),
            ),
          ),
          child: Center(
            child: InkWell(
              onTap: onPlay,
              child: isPlaying!
                  ? Icon(Icons.pause, color: Constant.whiteColor, size: 50.sp)
                  : Icon(Icons.play_arrow_rounded,
                      color: Constant.whiteColor, size: 50.sp),
              // buildContainer(
              //     svg: isPlaying! ? "assets/icons/pause.svg" : "assets/icons/icon_play.svg",
              //     h: 30.h,
              //     w: 30.w,
              //     imgw: icoplaywidth.w,
              //     imgh: icoplayhight.h),
            ),
          ),
        ),

        /// =================== Forward ===================
        Container(
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/icons/Group1.png'),
            ),
          ),
          child: Center(
            child: InkWell(
              onTap: forward,
              child: buildContainer(
                  svg: 'assets/icons/forward.svg', imgw: 25.w, imgh: 25.h),
            ),
          ),
        ),
        // Stack(
        //   children: [
        //     Container(
        //       height: nexthight.h,
        //       width: nextwidth.w,
        //       decoration: const BoxDecoration(
        //         shape: BoxShape.circle,
        //         image: DecorationImage(
        //           fit: BoxFit.fill,
        //           image: AssetImage('assets/icons/Group1.png'),
        //         ),
        //       ),
        //       child: Center(
        //         child: InkWell(
        //           onTap: forward,
        //           child: buildContainer(svg: 'assets/icons/forward.svg', imgw: iconextwidth.w, imgh: iconexthight.h),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),

        /// =================== onStop ===================
        SizedBox(width: 27.w),
        Container(
          height: iconStopHeight!.h,
          width: iconStopWidth!.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/icons/Group1.png'),
            ),
          ),
          child: Center(
            child: InkWell(
              onTap: onStop,
              child: Icon(Icons.stop,
                  size: iconStopSize!.sp, color: Constant.whiteColor),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildContainer(
      {String? svg,
      Color? colors,
      double? h,
      double? w,
      double? imgh,
      double? imgw}) {
    return Container(
      height: h,
      width: w,
      decoration: BoxDecoration(shape: BoxShape.circle),
      child: Center(
        child: SvgPicture.asset(svg!,
            height: imgh, width: imgw, fit: BoxFit.scaleDown, color: colors),
      ),
    );
  }
}
