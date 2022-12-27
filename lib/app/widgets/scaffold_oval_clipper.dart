import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked_themes/stacked_themes.dart';

import '../config/utils/flavor_config.dart';
import '../modules/Connectivity/views/network_sensitive.dart';
import 'clipper_shadow.dart';
import 'oval_bottom_clipper.dart';

class ScaffoldOvalClipper extends StatelessWidget {
  const ScaffoldOvalClipper({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return NetworkSensitive(
      child: SafeArea(
        child: Scaffold(
          body: Stack(alignment: Alignment.topCenter, children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: context.height * 0.54,
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
            // ClipPath(
            //   clipper: OvalBottomBorderClipper(),
            //   child: Container(
            //       width: context.width,
            //       height: context.height * 0.4,
            //       decoration: const BoxDecoration(
            //         color: Colors.white30,
            //         image: DecorationImage(
            //             // image: AssetImage("assets/pattern_white.png"),
            //             image: AssetImage("assets/pattern.png"),
            //             fit: BoxFit.cover),
            //       )),
            // ),
            ClipShadowPath(
              clipper: OvalBottomBorderClipper(),
              shadow: BoxShadow(
                  blurRadius: 16,
                  color: context.theme.shadowColor,
                  spreadRadius: 8),
              child: Container(
                  width: context.width,
                  height: context.height * 0.4,
                  decoration: BoxDecoration(
                    color: context.theme.cardColor,
                    image: DecorationImage(
                        image: getThemeManager(context).isDarkMode
                            ? const AssetImage("assets/pattern_white.png")
                            : const AssetImage("assets/pattern.png"),
                        fit: BoxFit.cover),
                  )),
            ),
            Positioned(
              top: context.height * 0.30,
              right: 0,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 8,
                        color: context.theme.shadowColor,
                        spreadRadius: 4)
                  ],
                ),
                child: CircleAvatar(
                  backgroundColor: context.theme.cardColor,
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
            ),
          ]),
        ),
      ),
    );
  }
}
