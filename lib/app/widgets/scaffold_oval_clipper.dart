import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/utils/flavor_config.dart';
import 'oval_bottom_clipper.dart';

class ScaffoldOvalClipper extends StatelessWidget {
  const ScaffoldOvalClipper({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(alignment: Alignment.topCenter, children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: context.height * 0.55,
              child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overScroll) {
                    overScroll.disallowIndicator();
                    return true;
                  },
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SingleChildScrollView(child: child))),
            ),
          ),
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
                width: context.width,
                height: context.height * 0.4,
                decoration: const BoxDecoration(
                  // color: Colors.grey[500],
                  color: Colors.white30,
                  // backgroundBlendMode: BlendMode.overlay,
                  image: DecorationImage(
                      // image: AssetImage("assets/pattern_white.png"),
                      image: AssetImage("assets/pattern.png"),
                      fit: BoxFit.cover),
                )),
          ),
          Positioned(
            top: context.height * 0.30,
            right: 0,
            left: 0,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 70,
              child: Center(
                child: SizedBox(
                  height: 120,
                  width: 120,
                  child: Image.asset(
                    FlavorConfig.instance.values.imagePath!,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
