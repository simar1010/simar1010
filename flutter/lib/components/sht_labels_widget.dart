import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/sht_colors.dart';

class ShtLabels extends StatelessWidget {
  final String? title;
  const ShtLabels({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15.w, bottom: 15.h),
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 13.w),
      decoration: BoxDecoration(
          color: ShtColors.bgListColor,
          borderRadius: BorderRadius.circular(5.r)),
      child: Text(title ?? '',
          style: TextStyle(
              color: ShtColors.themeColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500)),
    );
  }
}
