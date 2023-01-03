import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripplnr/utils/sht_colors.dart';

class ShtTextInputField extends StatelessWidget {
  final String hintLabel;
  final double? width;
  final double? height;
  final int? maxLength;
  final double? radius;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? inputTextColor;
  final Color? fillColor;
  final Color? focusColor;
  final Color? hintColor;
  final EdgeInsets? contentPadding;
  final OutlineInputBorder? errorBorder;
  final OutlineInputBorder? focusedBorder;
  final OutlineInputBorder? enabledBorder;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextInputAction? inputAction;
  final ValueChanged<String>? onChanged;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  TextEditingController? controller;
  bool? enabled;
  bool readOnly;
  VoidCallback? onTap;
  final bool obscureText;
  ShtTextInputField(
      {Key? key,
      required this.hintLabel,
      this.width,
      this.height,
      this.maxLength,
      this.keyboardType,
      this.inputAction,
      this.suffixIcon,
      this.prefixIcon,
      this.fillColor,
      this.contentPadding,
      this.focusColor,
      this.inputTextColor,
      this.hintColor,
      this.errorBorder,
      this.focusedBorder,
      this.enabledBorder,
      this.onChanged,
      this.validator,
      this.onSaved,
      this.radius,
      this.controller,
      this.enabled,
      this.readOnly = false,
      this.onTap,
      this.inputFormatters,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 309.w,
      // height: height ?? 52.h,
      child: TextFormField(
        obscureText: obscureText,
        validator: validator,
        readOnly: readOnly,
        onTap: onTap,
        enabled: enabled,
        controller: controller,
        onChanged: onChanged,
        onSaved: onSaved,
        maxLength: maxLength,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        textInputAction: inputAction,
        textAlign: TextAlign.left,
        style: TextStyle(color: Colors.black, fontSize: 13.sp),
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          filled: true,
          focusColor: focusColor ?? ShtColors.focusColor.withOpacity(0.1),
          fillColor: fillColor ?? Colors.white,
          contentPadding:
              contentPadding ?? EdgeInsets.only(top: 14.h, left: 14.w),
          prefixIcon: prefixIcon,
          hintStyle: TextStyle(
              color: ShtColors.outlineColor,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500),
          hintText: hintLabel,
          border: InputBorder.none,
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius ?? 10.r),
                borderSide:
                    BorderSide(width: 1.r, color: ShtColors.outlineColor),
              ),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius ?? 10.r),
                borderSide: BorderSide(width: 1.r, color: ShtColors.blackColor),
              ),
          errorBorder: errorBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius ?? 10.r),
                borderSide: BorderSide(width: 1.r, color: Colors.red),
              ),
          focusedErrorBorder: errorBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius ?? 10.r),
                borderSide: BorderSide(width: 1.r, color: Colors.red),
              ),
        ),
      ),
    );
  }
}
