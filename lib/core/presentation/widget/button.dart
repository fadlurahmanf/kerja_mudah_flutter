// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:kerja_mudah/core/constant/colors.dart';
import 'package:kerja_mudah/core/constant/textstyle.dart';
import 'package:sizer/sizer.dart';

enum AppButtonType{
  FILLED, OUTLINED,
}

class AppButton extends StatelessWidget {
  final AppButtonType? type;
  final Widget Function(BuildContext, TextStyle) child;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final double? radius;
  final double? elevation;
  const AppButton({
    this.type = AppButtonType.FILLED,
    required this.child,
    this.onPressed,
    this.padding,
    this.backgroundColor,
    this.radius,
    this.elevation,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return type == AppButtonType.OUTLINED ? outlinedButton(context)
        : filledButton(context);
  }

  Widget filledButton(BuildContext context){
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular((radius?.sp)??25.sp),
          )),
          elevation: MaterialStateProperty.all<double>(elevation??2),
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor??AppColor.GREEN),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(padding??EdgeInsets.symmetric(horizontal: 15, vertical: 10))
        ),
        child: child(context, AppTextStyle.body14(color: Colors.white, fontWeight: FontWeight.w600)),
    );
  }

  Widget outlinedButton(BuildContext context){
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular((radius?.sp)??25.sp),
            side: BorderSide(width: 1, color: AppColor.GREEN)
          )),
          elevation: MaterialStateProperty.all<double>(elevation??0),
          alignment: Alignment.center,
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(padding??EdgeInsets.symmetric(horizontal: 15, vertical: 7))
      ),
      child: child(context, AppTextStyle.body14(color: AppColor.GREEN, fontWeight: FontWeight.w600)),
    );
  }
}
