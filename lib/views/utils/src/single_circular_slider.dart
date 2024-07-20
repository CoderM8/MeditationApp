import 'package:flutter/material.dart';
import '../../../constant/constant.dart';
import 'circular_slider_paint.dart';

class SingleCircularSlider extends StatefulWidget {
  final int divisions;
  final int position;
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
  final bool? showRoundedCapInSelection;
  final bool? showHandlerOutter;
  final double? sliderStrokeWidth;
  final bool? shouldCountLaps;

  SingleCircularSlider(this.divisions, this.position,
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
      this.showRoundedCapInSelection,
      this.showHandlerOutter,
      this.sliderStrokeWidth,
      this.shouldCountLaps})
      : assert(position >= 0 && position <= divisions,
            'init has to be > 0 and < divisions value'),
        assert(divisions >= 0 && divisions <= 3600,
            'divisions has to be > 0 and <= 300');

  @override
  _SingleCircularSliderState createState() => _SingleCircularSliderState();
}

class _SingleCircularSliderState extends State<SingleCircularSlider> {
  int? _end;

  @override
  void initState() {
    super.initState();
    _end = widget.position;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 220,
      width: widget.width ?? 220,
      child: CircularSliderPaint(
          mode: CircularSliderMode.singleHandler,
          init: 0,
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
          showRoundedCapInSelection: widget.showRoundedCapInSelection ?? false,
          showHandlerOutter: widget.showHandlerOutter ?? true,
          shouldCountLaps: widget.shouldCountLaps ?? false),
    );
  }
}
