import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meditation/views/utils/textwidget.dart';
import '../../constant/constant.dart';

class PositionSeekWidget extends StatefulWidget {
  final Duration currentPosition;
  final Duration duration;
  final Function(Duration) seekTo;

  const PositionSeekWidget(
      {required this.currentPosition,
      required this.duration,
      required this.seekTo});

  @override
  _PositionSeekWidgetState createState() => _PositionSeekWidgetState();
}

class _PositionSeekWidgetState extends State<PositionSeekWidget> {
  late Duration _visibleValue;
  bool listenOnlyUserInteraction = false;

  double get percent => widget.duration.inMilliseconds == 0
      ? 0
      : _visibleValue.inMilliseconds / widget.duration.inMilliseconds;

  @override
  void initState() {
    super.initState();
    _visibleValue = widget.currentPosition;
  }

  @override
  void didUpdateWidget(PositionSeekWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!listenOnlyUserInteraction) {
      _visibleValue = widget.currentPosition;
    }
  }

  @override
  Widget build(BuildContext context) {
    Duration d = widget.duration - widget.currentPosition;
    String m = d.toString().substring(2, 4);
    String s = d.toString().substring(5, 7);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Slider(
            activeColor: Constant.whiteColor,
            thumbColor: Constant.whiteColor,
            inactiveColor: Constant.alertDialogColor,
            label: widget.duration.toString(),
            min: 0,
            max: widget.duration.inMilliseconds.toDouble(),
            value: percent * widget.duration.inMilliseconds.toDouble(),
            onChangeEnd: (newValue) {
              setState(() {
                listenOnlyUserInteraction = false;
                widget.seekTo(_visibleValue);
              });
            },
            onChangeStart: (_) {
              setState(() {
                listenOnlyUserInteraction = true;
              });
            },
            onChanged: (newValue) {
              setState(() {
                final to = Duration(milliseconds: newValue.floor());
                _visibleValue = to;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: 40,
                child: Styles.regular(durationToString(widget.currentPosition),
                    c: Constant.whiteColor, fs: 10.sp),
              ),
              SizedBox(
                width: 40,
                child: Styles.regular(durationToString(widget.duration),
                    c: Constant.whiteColor, fs: 10.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

String durationToString(Duration duration) {
  String twoDigits(int n) {
    if (n >= 10) return '$n';
    return '0$n';
  }

  final twoDigitHours =
      twoDigits(duration.inHours.remainder(Duration.hoursPerDay));
  final twoDigitMinutes =
      twoDigits(duration.inMinutes.remainder(Duration.minutesPerHour));
  final twoDigitSeconds =
      twoDigits(duration.inSeconds.remainder(Duration.secondsPerMinute));
  return twoDigitHours == "00"
      ? '$twoDigitMinutes:$twoDigitSeconds'
      : '$twoDigitHours:$twoDigitMinutes:$twoDigitSeconds';
}
