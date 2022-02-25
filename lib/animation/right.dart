import 'dart:async';
import 'package:flutter/material.dart';
class RightAnimator extends StatefulWidget {
  final Widget child;
  final Duration time;
  RightAnimator(this.child, this.time);
  @override
  _RightAnimatorState createState() => _RightAnimatorState();
}

class _RightAnimatorState extends State<RightAnimator> with SingleTickerProviderStateMixin {
  Timer? timer;
  AnimationController ?animationController;
  Animation? animation;
  @override
  void initState() {
    super.initState();
    animationController =AnimationController(duration: Duration(milliseconds:500 ), vsync: this);
    animation =CurvedAnimation(parent: animationController!, curve: Curves.easeInOut);
    timer = Timer(widget.time, animationController!.forward);
  }
  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
    animationController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation!,
      child: widget.child,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: animation!.value,
          child: Transform.translate(
            offset: Offset(0.0, (1 - animation!.value) * 20),
            child: child!,
          ),
        );
      },
    );
  }
}

Timer ?timer;
Duration duration = Duration(milliseconds: 1200);
wait(int time) {
  if (timer == null || !timer!.isActive) {
    timer = Timer(Duration(milliseconds: time), () {
      duration = Duration();
    });
  }
  duration += Duration(milliseconds: 400);
  return duration;
}
class RightWidgetANimator extends StatelessWidget {
  final Widget child;
  final int time;
  RightWidgetANimator(this.child,this.time);
  @override
  Widget build(BuildContext context) {
    return RightAnimator(child, wait(time));
  }
}