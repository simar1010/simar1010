import 'package:flutter/material.dart';

class ShtAssets {
  static String loginBg = 'assets/images/login_bg.png';
  static String homeBg = 'assets/images/home_bg.png';
  static String trivago = 'assets/images/trivago.png';
  static String hotel = 'assets/images/bghotel.png';
  static String hotel1 = 'assets/images/hotel1.png';
  static String hotel2 = 'assets/images/hotel2.png';
  static String hotel3 = 'assets/images/hotel3.png';
  static String hotel4 = 'assets/images/hotel4.png';
  static String hotel5 = 'assets/images/hotel5.png';
  static String hotel6 = 'assets/images/hotel6.png';
}

class ShtIcons {
  //social
  static String emailIcon = 'assets/icons/email_icon.svg';
  static String passwordIcon = 'assets/icons/password_icon.svg';
  static String googleIcon = 'assets/icons/google_icon.png';
  static String facebookIcon = 'assets/icons/facebook_icon.png';
  static String appleIcon = 'assets/icons/apple_icon.png';
  static String userIcon = 'assets/icons/user_icon.svg';
  static String locationIcon = 'assets/icons/location_icon.png';
  static String calenderIcon = 'assets/icons/calender_icon.png';
  static String guestIcon = 'assets/icons/guest_icon.png';
  static String closeIcon = 'assets/icons/close_icon.png';
  static String backIcon = 'assets/icons/noun_back.svg';
  static String sortIcon = 'assets/icons/noun_sort.svg';
  static String filterIcon = 'assets/icons/noun_filter.svg';
  static String locationIcon2 = 'assets/icons/noun_location.svg';
}

class AddSpace {
  static Widget horizontal(double width) {
    return SizedBox(
      width: width,
    );
  }

  static Widget verticle(double height) {
    return SizedBox(
      height: height,
    );
  }
}
