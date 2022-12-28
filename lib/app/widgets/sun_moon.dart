import 'package:flutter/material.dart';

/// [Widget] for rendering the Sun and Moon Asset
class SunMoon extends StatelessWidget {
  /// Whether currently the Sun is displayed
  final bool? isSun;

  /// Initialize the Class
  const SunMoon({
    Key? key,
    this.isSun,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.0,
      child: AnimatedSwitcher(
        switchInCurve: Curves.ease,
        switchOutCurve: Curves.ease,
        duration: const Duration(milliseconds: 250),
        child: isSun!
            ? Container(
                key: const ValueKey(1),
                child: const Image(
                  image: AssetImage(
                    "assets/sun.png",
                  ),
                ))
            : Container(
                key: const ValueKey(2),
                child: const Image(
                  image: AssetImage("assets/moon.png"),
                ),
              ),
        transitionBuilder: (child, anim) {
          return ScaleTransition(
            scale: anim,
            child: FadeTransition(
              opacity: anim,
              child: SlideTransition(
                position: anim.drive(
                  Tween(
                    begin: const Offset(0, 4),
                    end: const Offset(0, 0),
                  ),
                ),
                child: child,
              ),
            ),
          );
        },
      ),
    );
  }
}
