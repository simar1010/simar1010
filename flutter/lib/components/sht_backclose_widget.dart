import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tripplnr/utils/sht_assets.dart';

class ShtBackCloseWidget extends StatelessWidget {
  final bool isSvg;
  final Color? bgColor;
  final Color? iconColor;
  final String? svgIcon;
  final double? height;
  final double? width;
  final double? iconHeight;
  final double? iconWidth;
  final ShapeBorder? shape;
  final VoidCallback? onPressed;
  const ShtBackCloseWidget({
    Key? key,
    this.isSvg = false,
    this.bgColor,
    this.iconColor,
    this.svgIcon,
    this.height,
    this.width,
    this.iconHeight,
    this.iconWidth,
    this.shape,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: shape ?? const CircleBorder(),
      padding: EdgeInsets.zero,
      minWidth: width ?? 44.w,
      height: height ?? 44.h,
      color: bgColor,
      onPressed: onPressed ??
          () {
            Navigator.pop(context);
          },
      child: isSvg
          ? SvgPicture.asset(
              svgIcon ?? ShtIcons.backIcon,
              color: iconColor ?? Colors.black,
              height: iconHeight ?? 15.h,
              width: iconWidth ?? 15.w,
            )
          : Image.asset(
              svgIcon ?? ShtIcons.closeIcon,
              color: iconColor ?? Colors.black,
              height: iconHeight ?? 15.h,
              width: iconWidth ?? 15.w,
            ),
    );
  }
}
