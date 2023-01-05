import 'package:flutter/material.dart';

import '../config/theme/theme.dart';

class AppLoadingWidget extends StatelessWidget {
  final Color? color;
  final double size;
  final double strokeWidth;

  factory AppLoadingWidget.small({Color? color}) => AppLoadingWidget(
        size: 10.0,
        color: color,
        strokeWidth: 1,
      );

  const AppLoadingWidget(
      {Key? key, this.color, this.size = 40.0, this.strokeWidth = 3})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          color: color ?? AppColors.primaryDarkColor,
          strokeWidth: strokeWidth,
        ),
      ),
    );
  }
}
