import 'package:flutter/material.dart';

class AnimatedPositionBox extends StatelessWidget {
  const AnimatedPositionBox({
    Key? key,
    required this.mainChild,
    required this.isLeft,
    required this.opacityWrapper,
    required this.onEndFun,
  }) : super(key: key);

  final Widget mainChild;
  final bool isLeft;
  final bool opacityWrapper;
  final Function onEndFun;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      curve: Curves.fastOutSlowIn,
      tween: Tween<double>(begin: 0, end: 85),
      duration: const Duration(milliseconds: 1700),
      builder: (context, double value, child) {
        if (opacityWrapper) {
          return Opacity(
            opacity: value / 90,
            child: Container(
              color: Colors.white,
              margin: EdgeInsets.only(
                left: isLeft ? value : 0,
                right: isLeft ? 0 : value,
              ),
              child: child,
            ),
          );
        } else {
          return Container(
            color: Colors.white,
            margin: EdgeInsets.only(
              left: isLeft ? value : 0,
              right: isLeft ? 0 : value,
            ),
            child: child,
          );
        }
      },
      child: mainChild,
      onEnd: () {
        onEndFun();
      },
    );
  }
}
