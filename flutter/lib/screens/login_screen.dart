import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tripplnr/components/sht_button_widget.dart';
import 'package:tripplnr/components/sht_textinputfield_widget.dart';
import 'package:tripplnr/router/routes_name.dart';
import 'package:tripplnr/utils/sht_assets.dart';
import 'package:tripplnr/utils/sht_colors.dart';
import 'dart:io' show Platform;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  height: 310.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: AssetImage(ShtAssets.loginBg))),
                ),
                Positioned(
                    top: 30.h,
                    right: 22.w,
                    child: ShtButtonWidget(
                      radius: 10.r,
                      height: 26,
                      width: 50,
                      padding: EdgeInsets.zero,
                      title: 'Skip',
                      color: ShtColors.blackColor.withOpacity(0.6),
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, RoutesName.home);
                      },
                    )),
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
                  Text('Sign In',
                      style: TextStyle(
                          color: ShtColors.blackColor,
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w900)),
                  SizedBox(height: 8.h),
                  Text('Welcome Back to Hotel!',
                      style: TextStyle(
                          color: ShtColors.lightGreyColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500)),
                  SizedBox(height: 25.h),
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
                  SizedBox(height: 13.h),
                  Container(
                      alignment: Alignment.centerRight,
                      width: double.infinity,
                      child: Text('Forgot Password?',
                          style: TextStyle(
                              color: ShtColors.blackColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500))),
                  SizedBox(height: 25.h),
                  ShtButtonWidget(
                      title: 'Login',
                      color: ShtColors.blackColor,
                      height: 48.h,
                      radius: 10.r,
                      onPressed: () {
                        Navigator.pushNamed(context, RoutesName.search);
                      }),
                  SizedBox(height: 25.h),
                  Container(
                      alignment: Alignment.center,
                      child: Text('Or sign in with',
                          style: TextStyle(
                              color: ShtColors.lightGreyColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500))),
                  SizedBox(height: 25.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(ShtIcons.googleIcon,
                          width: 75.w, height: 36.h),
                      Image.asset(ShtIcons.facebookIcon,
                          width: 75.w, height: 36.h),
                      Platform.isIOS
                          ? Image.asset(ShtIcons.appleIcon,
                              width: 75.w, height: 36.h)
                          : const SizedBox(),
                    ],
                  ),
                  SizedBox(height: 35.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don’t have an Account?',
                          style: TextStyle(
                              color: ShtColors.normalGreyColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        width: 5.w,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, RoutesName.register);
                          },
                          child: Container(
                              height: 20.h,
                              alignment: Alignment.center,
                              child: Text('Sign Up',
                                  style: TextStyle(
                                      color: ShtColors.blackColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500)))),
                    ],
                  ),
                  SizedBox(height: 30.h)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
