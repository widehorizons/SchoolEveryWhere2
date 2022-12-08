import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.isOutlined = false,
    this.isCircular = false,
    this.color = Colors.blue,
    this.borderColor = Colors.white,
    this.radius = 8,
    this.height = 30,
    this.width = 30,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  final Widget child;
  final Function() onPressed;
  final bool isOutlined;
  final bool isCircular;
  final Color? color;
  final Color? backgroundColor;
  final Color? borderColor;
  final double radius;
  final double height;
  final double width;
  factory CustomButton.formal({
    required Widget child,
    required Function() onPressed,
  }) {
    return CustomButton(
      child: child,
      onPressed: onPressed,
      isCircular: true,
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
                elevation: 0,
                primary: backgroundColor,
                onPrimary: color, //?? AppTheme.appColor,
                shape: isCircular
                    ? CircleBorder(
                        side: BorderSide(color: borderColor ?? Colors.white),
                      )
                    : RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(radius),
                        side: BorderSide(
                            color: borderColor!), //?? AppTheme.appColor
                      ),
                minimumSize: Size(width, height),
              )
            : ElevatedButton.styleFrom(
                foregroundColor: color ?? Colors.white,
                backgroundColor: backgroundColor,
                elevation: 0,
                shape: isCircular
                    ? CircleBorder(
                        side: BorderSide(
                            color: borderColor!), // ?? AppTheme.appColor
                      )
                    : RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(radius),
                        side: BorderSide(
                            color: borderColor!,
                            width: 2), //?? AppTheme.appColor
                      ),
                minimumSize: Size(width, height),
              ),
        child: child,
      ),
    );
  }
}
