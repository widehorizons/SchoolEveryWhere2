import 'dart:math';

import 'package:flutter/material.dart';

import '../config/Constants/dimensions.dart';
import 'sun_moon.dart';

/// [Widget] for rendering the box container of the sun and moon.
class DayNightGreetingBanner extends StatelessWidget {
  const DayNightGreetingBanner({Key? key}) : super(key: key);

  /// Get the background color of the container, representing the time of day
  Color? getColor(bool isDay, bool isDusk) {
    if (!isDay) {
      return Colors.blueGrey[900];
    }
    if (isDusk) {
      return Colors.orange[400];
    }
    return Colors.blue[200];
  }

  double mapRange(
    double value,
    double iMin,
    double iMax, [
    double oMin = 0,
    double oMax = 1,
  ]) {
    return ((value - iMin) * (oMax - oMin)) / (iMax - iMin) + oMin;
  }

  @override
  Widget build(BuildContext context) {
    final timeState = DateTime.now();
    final hour = timeState.hour;
    final isDay = hour >= 6 && hour <= 18;
    final isDusk = hour >= 16 && hour <= 18;

    final displace = mapRange(timeState.hour * 1.0, 0, 23);

    return AnimatedContainer(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      margin: const EdgeInsets.all(ksmallMargin),
      decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.darken,
          color: getColor(isDay, isDusk),
          borderRadius: const BorderRadius.all(Radius.circular(kMediumMargin))),
      height: 150,
      duration: const Duration(seconds: 1),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth.round() - 100.0;
          final top = sin(pi * displace) * 1.5;
          final left = maxWidth * displace;
          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              AnimatedPositioned(
                curve: Curves.ease,
                bottom: top,
                left: left,
                duration: const Duration(milliseconds: 200),
                child: SunMoon(
                  isSun: isDay,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
