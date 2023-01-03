import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripplnr/utils/sht_colors.dart';

class ShtButtonWidget extends StatelessWidget {
  final bool isMinWIdth;
  final Widget? child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final TextStyle? textStyle;
  final String? title;
  final Color color;
  final Color? textColor;
  final double? width;
  final double? height;
  final VoidCallback onPressed;
  final double? radius;
  final BoxBorder? border;
  const ShtButtonWidget({
    Key? key,
    this.title,
    this.textStyle,
    this.padding,
    this.margin,
    this.isMinWIdth = false,
    required this.onPressed,
    this.child,
    this.height,
    this.width,
    this.color = ShtColors.themeColor,
    this.textColor,
    this.radius,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 16.r),
        border: border,
      ),
      child: MaterialButton(
          minWidth: isMinWIdth ? width : null,
          padding: padding ?? EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 16.r)),
          color: color,
          onPressed: onPressed,
          child: Container(
            width: width,
            height: height ?? 60.h,
            alignment: Alignment.center,
            child: child ??
                Text(
                  title ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: textColor ?? Colors.white, fontSize: 14.sp),
                ),
          )),
    );
  }
}
