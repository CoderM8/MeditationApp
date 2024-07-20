import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meditation/views/utils/textwidget.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import '../../constant/constant.dart';
import '../../constant/image_constant.dart';
import '../../generated/l10n.dart';

class BreathCircleSecond extends StatefulWidget {
  final String? imageUrl;
  final String? songUrl;
  final String? time;
  final Duration? duration;

  BreathCircleSecond(
      {Key? key, this.time, this.duration, this.imageUrl, this.songUrl})
      : super(key: key);

  @override
  _BreathCircleSecondState createState() => _BreathCircleSecondState();
}

class _BreathCircleSecondState extends State<BreathCircleSecond>
    with SingleTickerProviderStateMixin {
  final StopWatchTimer _stopWatchTimer =
      StopWatchTimer(mode: StopWatchMode.countDown, isLapHours: true);
  AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();
  RxBool isShowFinishButton = false.obs;

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose(); // Need to call dispose function.
  }

  AnimationController? controller;

  @override
  void initState() {
    super.initState();
    print('imageUrl 🤢🤢🤢 ${widget.imageUrl}');
    print('songUrl 🤷‍♂️🤷‍♂️🤷‍♂️ ${widget.songUrl}');
    isShowFinishButton.value = false;
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.5,
      duration: Duration(seconds: 3),
    )..repeat();
    print('time :: ${widget.time ?? ''}');
    if (widget.duration != null) {
      _stopWatchTimer.setPresetMinuteTime(widget.duration!.inMinutes);
    } else {
      _stopWatchTimer.setPresetMinuteTime(int.parse(widget.time ?? ''));
    }
    _assetsAudioPlayer.open(
      Audio.network(widget.songUrl ?? '',
          metas: Metas(
            image: MetasImage.network(
              widget.imageUrl ?? '',
            ),
          )),
      loopMode: LoopMode.single,
      autoStart: true,
      notificationSettings: NotificationSettings(
        playPauseEnabled: true,
      ),
      showNotification: false,
    );
    _stopWatchTimer.onStartTimer();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _stopWatchTimer.clearPresetTime();
        _assetsAudioPlayer.stop();
        _controller?.stop();
        return true;
      },
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              /// =================== Background Image ===================
              Positioned.fill(
                child: Container(
                  child: SvgPicture.asset(breathBackgroundImage,
                      fit: BoxFit.cover),
                ),
              ),

              AppBar(
                backgroundColor: Colors.transparent,
                leading: Padding(
                  padding: EdgeInsets.all(11.0.sp),
                  child: InkWell(
                      onTap: () {
                        _assetsAudioPlayer.stop();
                        _controller?.stop();
                        Get.back();
                      },
                      child: SvgPicture.asset(breathBackArrowImage)),
                ),
                title: Styles.regular(
                    al: TextAlign.center,
                    S.of(context).breath,
                    c: Constant.whiteColor,
                    fs: 24),
                centerTitle: true,
              ),

              /// =================== 00:30 & Play Button ===================
              Transform.translate(
                  offset: Offset(0, -100),
                  child: _buildBody(
                    onTap: () {
                      // _stopWatchTimer.onStopTimer();
                    },
                  )),

              /// =================== Finish Button ===================
              Obx(() {
                return isShowFinishButton.value == true
                    ? Positioned(
                        top: 270.h,
                        left: 85.w,
                        child: Center(
                          child: SizedBox(
                            width: 221,
                            height: 57,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: StadiumBorder(),
                                backgroundColor: Constant.whiteColor,
                              ),
                              // onPressed:onTap,
                              onPressed: () {
                                _controller?.stop();
                                _stopWatchTimer.clearPresetTime();
                                Get.back();
                              },
                              child: Text(S.of(context).finishButton,
                                  style: TextStyle(
                                      color: Color(0xff002D38), fontSize: 15)),
                            ),
                          ),
                        ),
                      )
                    : SizedBox();
              }),

              Positioned.fill(
                top: 500.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    StreamBuilder<int>(
                      stream: _stopWatchTimer.rawTime,
                      initialData: 1,
                      builder: (context, snap) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (_stopWatchTimer.secondTime.value == 0) {
                            isShowFinishButton.value = true;
                            _assetsAudioPlayer.stop();
                          } else {
                            isShowFinishButton.value = false;
                          }
                        });

                        final value = snap.data;
                        final displayTime = StopWatchTimer.getDisplayTime(
                            value ?? 0,
                            milliSecond: false,
                            hours: true,
                            second: true);
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
                    SizedBox(height: 80.h),
                    StreamBuilder<bool>(
                        stream: _assetsAudioPlayer.isPlaying,
                        builder: (context, snapshot) {
                          return GestureDetector(
                            onTap: isShowFinishButton.value == true
                                ? null
                                : () async {
                                    if (/*_stopWatchTimer.isRunning == false &&*/ _assetsAudioPlayer
                                        .isPlaying.value) {
                                      _stopWatchTimer.onStopTimer();
                                    } else {
                                      _stopWatchTimer.onStartTimer();
                                    }
                                    // if (_assetsAudioPlayer.playlist != null) {
                                    _assetsAudioPlayer.playOrPause();
                                    // }
                                  },
                            child: Container(
                              height: 66.h,
                              width: 66.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff4C6064),
                              ),
                              child: Icon(
                                  _assetsAudioPlayer.isPlaying.value
                                      ? Icons.pause
                                      : Icons.play_arrow_rounded,
                                  size: 35,
                                  color: Colors.white),
                            ),
                          );
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

AnimationController? _controller;

Widget _buildBody({
  Function()? onTap,
}) {
  return AnimatedBuilder(
    animation:
        CurvedAnimation(parent: _controller!, curve: Curves.fastOutSlowIn),
    builder: (context, child) {
      return Stack(
        alignment: Alignment.center,
        children: <Widget>[
          _buildContainer(150 * _controller!.value),
          _buildContainer(200 * _controller!.value),
          _buildContainer(250 * _controller!.value),
          _buildContainer(300 * _controller!.value),
          _buildContainer(350 * _controller!.value),
          Align(
            child: Icon(Icons.circle, color: Color(0xFF06576A), size: 26),
          ),
        ],
      );
    },
  );
}

Widget _buildContainer(double radius) {
  return Container(
    width: radius,
    height: radius,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.teal.withOpacity(1 - _controller!.value),
    ),
  );
}
