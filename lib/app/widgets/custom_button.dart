import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/theme/theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.isOutlined = false,
    this.isCircular = false,
    this.color = AppColors.lightGreyBackground,
    this.borderColor = Colors.transparent,
    this.radius = 8,
    this.height = 40,
    this.width = 80,
    this.backgroundColor = AppColors.primaryColor,
  }) : super(key: key);

  final Widget child;
  final Function() onPressed;
  final bool isOutlined;
  final bool isCircular;
  final Color? color;
  final Color? backgroundColor;
  final Color borderColor;
  final double radius;
  final double height;
  final double width;
  factory CustomButton.formal({
    required Widget child,
    required Function() onPressed,
  }) {
    return CustomButton(
      onPressed: onPressed,
      isCircular: true,
      child: child,
    );
  }
  factory CustomButton.primary({
    Color? backgroungColor,
    required Widget child,
    required Function() onPressed,
  }) {
    return CustomButton(
      onPressed: onPressed,
      backgroundColor: backgroungColor, //?? PrimaryColors.cyan
      borderColor: Colors.black,
      color: Colors.black,
      isCircular: true,
      child: child,
    );
  }
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: isOutlined
            ? ElevatedButton.styleFrom(
                shadowColor: context.theme.shadowColor,
                foregroundColor: color,
                backgroundColor: context.theme.scaffoldBackgroundColor,
                elevation: 5, //?? AppTheme.appColor,
                shape: isCircular
                    ? CircleBorder(
                        side: BorderSide(color: borderColor, width: 1),
                      )
                    : RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(radius),
                        side: BorderSide(
                            color: borderColor), //?? AppTheme.appColor
                      ),
                minimumSize: Size(width, height),
              )
            : ElevatedButton.styleFrom(
                shadowColor: context.theme.shadowColor,
                foregroundColor: color ?? Colors.white,
                backgroundColor: backgroundColor,
                elevation: 5,
                shape: isCircular
                    ? CircleBorder(
                        side: BorderSide(
                            color: borderColor), // ?? AppTheme.appColor
                      )
                    : RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(radius),
                        side: BorderSide(
                            color: borderColor,
                            width: 1), //?? AppTheme.appColor
                      ),
                minimumSize: Size(width, height),
              ),
        child: child,
      ),
    );
  }
}
