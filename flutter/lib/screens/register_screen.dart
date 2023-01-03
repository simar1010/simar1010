import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tripplnr/components/sht_button_widget.dart';
import 'package:tripplnr/components/sht_textinputfield_widget.dart';
import 'package:tripplnr/utils/sht_assets.dart';
import 'package:tripplnr/utils/sht_colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 230.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: AssetImage(ShtAssets.loginBg))),
                ),
                Positioned(
                  right: 0,
                  left: 0,
                  bottom: -1,
                  child: Container(
                      height: 35.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35.r),
                            topRight: Radius.circular(35.r)),
                      )),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 33.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Sign Up',
                      style: TextStyle(
                          color: ShtColors.blackColor,
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w900)),
                  SizedBox(height: 8.h),
                  Text('Access with sign up!',
                      style: TextStyle(
                          color: ShtColors.lightGreyColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500)),
                  SizedBox(height: 25.h),
                  ShtTextInputField(
                      keyboardType: TextInputType.text,
                      hintLabel: 'First Name',
                      prefixIcon: Padding(
                        padding: EdgeInsetsDirectional.only(
                            start: 20.w, end: 16.w, top: 17.h, bottom: 17.h),
                        child: SvgPicture.asset(ShtIcons.userIcon,
                            color: ShtColors.darkGreyColor,
                            width: 14.w,
                            height: 11.h), // myIcon is a 48px-wide widget.
                      )),
                  SizedBox(height: 20.h),
                  ShtTextInputField(
                      keyboardType: TextInputType.text,
                      hintLabel: 'Last Name',
                      prefixIcon: Padding(
                        padding: EdgeInsetsDirectional.only(
                            start: 20.w, end: 16.w, top: 17.h, bottom: 17.h),
                        child: SvgPicture.asset(ShtIcons.userIcon,
                            color: ShtColors.darkGreyColor,
                            width: 14.w,
                            height: 11.h), // myIcon is a 48px-wide widget.
                      )),
                  SizedBox(height: 20.h),
                  ShtTextInputField(
                      keyboardType: TextInputType.emailAddress,
                      hintLabel: 'Email',
                      prefixIcon: Padding(
                        padding: EdgeInsetsDirectional.only(
                            start: 20.w, end: 16.w, top: 17.h, bottom: 17.h),
                        child: SvgPicture.asset(ShtIcons.emailIcon,
                            color: ShtColors.darkGreyColor,
                            width: 14.w,
                            height: 11.h), // myIcon is a 48px-wide widget.
                      )),
                  SizedBox(height: 20.h),
                  ShtTextInputField(
                      obscureText: true,
                      hintLabel: 'Password',
                      prefixIcon: Padding(
                        padding: EdgeInsetsDirectional.only(
                            start: 20.w, end: 16.w, top: 17.h, bottom: 17.h),
                        child: SvgPicture.asset(ShtIcons.passwordIcon,
                            color: ShtColors.darkGreyColor,
                            width: 14.w,
                            height: 11.h), // myIcon is a 48px-wide widget.
                      )),
                  SizedBox(height: 20.h),
                  ShtTextInputField(
                      obscureText: true,
                      hintLabel: 'Confirm Password',
                      prefixIcon: Padding(
                        padding: EdgeInsetsDirectional.only(
                            start: 20.w, end: 16.w, top: 17.h, bottom: 17.h),
                        child: SvgPicture.asset(ShtIcons.passwordIcon,
                            color: ShtColors.darkGreyColor,
                            width: 14.w,
                            height: 11.h), // myIcon is a 48px-wide widget.
                      )),
                  SizedBox(height: 30.h),
                  ShtButtonWidget(
                      color: ShtColors.blackColor,
                      title: 'Sign Up',
                      height: 48.h,
                      radius: 10.r,
                      onPressed: () {}),
                  SizedBox(height: 35.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an Account?',
                          style: TextStyle(
                              color: ShtColors.normalGreyColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        width: 5.w,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            alignment: Alignment.center,
                            height: 20.h,
                            child: Text('Log In',
                                style: TextStyle(
                                    color: ShtColors.blackColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500))),
                      )
                    ],
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
