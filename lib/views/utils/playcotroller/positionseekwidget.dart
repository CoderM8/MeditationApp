import 'package:flutter/material.dart';
import '../../../constant/constant.dart';

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
  bool listenOnlyUserInterraction = false;

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
    if (!listenOnlyUserInterraction) {
      _visibleValue = widget.currentPosition;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Expanded(
          //   child:
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            child: Slider(
              min: 0,
              max: widget.duration.inMilliseconds.toDouble(),
              value: percent * widget.duration.inMilliseconds.toDouble(),
              activeColor: Constant.whiteColor,
              inactiveColor: Colors.grey,
              // style:
              // SliderStyle(variant: Colors.grey, accent: Colors.grey[500]),
              onChangeEnd: (newValue) {
                setState(() {
                  listenOnlyUserInterraction = false;
                  widget.seekTo(_visibleValue);
                });
              },
              onChangeStart: (_) {
                setState(() {
                  listenOnlyUserInterraction = true;
                });
              },
              onChanged: (newValue) {
                setState(() {
                  final to = Duration(milliseconds: newValue.floor());
                  _visibleValue = to;
                });
              },
            ),
          ),
          // ),
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: 70,
                  child: Text(
                    durationToString(widget.currentPosition),
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Constant.whiteColor),
                  ),
                ),
                SizedBox(
                  width: 70,
                  child: Text(
                    durationToString(widget.duration),
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Constant.whiteColor),
                  ),
                ),
              ],
            ),
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
