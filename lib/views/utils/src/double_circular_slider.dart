import 'package:flutter/material.dart';
import '../../../constant/constant.dart';
import 'circular_slider_paint.dart';

class DoubleCircularSlider extends StatefulWidget {
  final int divisions;
  final int init;
  final int end;
  final int? primarySectors;
  final int? secondarySectors;
  final Widget? child;
  final double? height;
  final double? width;
  final Color? baseColor;
  final Color? selectionColor;
  final Color? handlerColor;
  final SelectionChanged<int>? onSelectionChange;
  final SelectionChanged<int>? onSelectionEnd;
  final double? handlerOutterRadius;
  final bool? showHandlerOutter;
  final double? sliderStrokeWidth;
  final bool? shouldCountLaps;

  DoubleCircularSlider(this.divisions, this.init, this.end,
      {this.height,
      this.width,
      this.child,
      this.primarySectors,
      this.secondarySectors,
      this.baseColor,
      this.selectionColor,
      this.handlerColor,
      this.onSelectionChange,
      this.onSelectionEnd,
      this.handlerOutterRadius,
      this.showHandlerOutter,
      this.sliderStrokeWidth,
      this.shouldCountLaps})
      : assert(init >= 0 && init <= divisions,
            'init has to be > 0 and < divisions value'),
        assert(end >= 0 && end <= divisions,
            'end has to be > 0 and < divisions value'),
        assert(divisions >= 0 && divisions <= 300,
            'divisions has to be > 0 and <= 300');

  @override
  _DoubleCircularSliderState createState() => _DoubleCircularSliderState();
}

class _DoubleCircularSliderState extends State<DoubleCircularSlider> {
  int? _init;
  int? _end;

  @override
  void initState() {
    super.initState();
    _init = widget.init;
    _end = widget.end;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 220,
      width: widget.width ?? 220,
      child: CircularSliderPaint(
          mode: CircularSliderMode.doubleHandler,
          init: _init,
          end: _end,
          divisions: widget.divisions,
          primarySectors: widget.primarySectors ?? 0,
          secondarySectors: widget.secondarySectors ?? 0,
          child: widget.child,
          onSelectionChange: (newInit, newEnd, laps) {
            if (widget.onSelectionChange != null) {
              widget.onSelectionChange!(newInit, newEnd, laps);
            }
            setState(() {
              _init = newInit;
              _end = newEnd;
            });
          },
          onSelectionEnd: (newInit, newEnd, laps) {
            if (widget.onSelectionEnd != null) {
              widget.onSelectionEnd!(newInit, newEnd, laps);
            }
          },
          sliderStrokeWidth: widget.sliderStrokeWidth ?? 12.0,
          baseColor: widget.baseColor ?? Color.fromRGBO(255, 255, 255, 0.1),
          selectionColor:
              widget.selectionColor ?? Color.fromRGBO(255, 255, 255, 0.3),
          handlerColor: widget.handlerColor ?? Constant.whiteColor,
          handlerOutterRadius: widget.handlerOutterRadius ?? 12.0,
          showRoundedCapInSelection: false,
          showHandlerOutter: widget.showHandlerOutter ?? true,
          shouldCountLaps: widget.shouldCountLaps ?? false),
    );
  }
}
