import 'package:flutter/material.dart';
import '../components/slider_info.dart';

class SliderWraperStful extends StatefulWidget {
  SliderWraperStful(this.slider, this.widgets, {Key key}) : super(key: key);
  final Widget widgets;
  final SliderInfo slider;

  @override
  _SliderWraperStfulState createState() => _SliderWraperStfulState();
}

class _SliderWraperStfulState extends State<SliderWraperStful> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity < -180)
          setState(() {
            widget.slider.incValue();
          });
        else if (details.primaryVelocity > 180)
          setState(() {
            widget.slider.decValue();
          });
      },
      child: Column(
        children: [widget.widgets, SliderDotsStful(widget.slider)],
      ),
    );
  }
}

class SliderDotsStful extends StatefulWidget {
  SliderDotsStful(this.slider, {Key key}) : super(key: key);
  final SliderInfo slider;

  @override
  _SliderDotsStfulState createState() => _SliderDotsStfulState();
}

class _SliderDotsStfulState extends State<SliderDotsStful> {
  @override
  Widget build(BuildContext context) {
    final list = <Widget>[];
    for (int i = 0; i < widget.slider.numberOfDots; i++) {
      list.add(Container(
        width: 16,
        height: 32,
        child: InkWell(
          splashColor: Color(0x00),
          highlightColor: Color(0x00),
          onTap: () {
            setState(() {
              widget.slider.setValue(i);
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 4, vertical: 12),
            decoration: BoxDecoration(
              border: i == widget.slider.currentValue
                  ? null
                  : Border.all(color: Color(0xff858585)),
              color: i == widget.slider.currentValue ? Color(0xff7ABF44) : null,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),
      ));
    }
    list.insert(
      0,
      Flexible(
        child: Container(
          child: InkWell(
            splashColor: Color(0x00),
            highlightColor: Color(0x00),
            onTap: () {
              setState(() {
                widget.slider.decValue();
              });
            },
          ),
        ),
      ),
    );
    list.add(
      Flexible(
        child: Container(
          child: InkWell(
            splashColor: Color(0x00),
            highlightColor: Color(0x00),
            onTap: () {
              setState(() {
                widget.slider.incValue();
              });
            },
          ),
        ),
      ),
    );

    return Container(
      height: 32,
      child: Row(
        children: list,
      ),
    );
  }
}
