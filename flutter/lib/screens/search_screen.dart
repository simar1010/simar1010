import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tripplnr/components/sht_button_widget.dart';
import 'package:tripplnr/components/sht_textinputfield_widget.dart';
import 'package:tripplnr/router/routes_name.dart';
import 'package:tripplnr/utils/sht_assets.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../utils/sht_colors.dart';
import 'home/home_screen_controller.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

var controller = Get.put<HomeController>(
  HomeController(),
);

class _SearchScreenState extends State<SearchScreen> {
  // final List<DateTime?> _singleDatePickerValueWithDefaultValue = [
  //   DateTime.now(),
  // ];
  datepicker() {
    showDialog(
        barrierColor: ShtColors.lightGreyColor.withOpacity(0.2),
        context: context,
        builder: ((context) => Dialog(
            backgroundColor: ShtColors.bgListColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r)),
            child: Container(
              padding: EdgeInsets.all(15.r),
              height: 380.h,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
              child: SfDateRangePicker(
                showActionButtons: true,
                showNavigationArrow: true,
                backgroundColor: Colors.transparent,
                selectionColor: ShtColors.themeColor,
                onSubmit: (p0) => Navigator.pop(context),
                view: DateRangePickerView.month,
                monthViewSettings:
                    DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
              ),
            ))));

    // await showCalendarDatePicker2Dialog(

    //   dialogBackgroundColor: ShtColors.themeColor,
    //   barrierColor: ShtColors.blackColor.withOpacity(0.1),
    //   context: context,
    //   config: CalendarDatePicker2WithActionButtonsConfig(),
    //   dialogSize: const Size(325, 400),
    //   initialValue: _singleDatePickerValueWithDefaultValue,
    //   borderRadius: BorderRadius.circular(15),
    // );
  }

  @override
  Widget build(BuildContext context) {
    print(controller.address.value);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitWidth, image: AssetImage(ShtAssets.homeBg))),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            height: 450.h,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(32.r)),
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 28.h),
                Text('Let’s Make your\nStay Worthy!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w900)),
                SizedBox(height: 32.h),
                Obx(() => ShtTextInputField(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide:
                          BorderSide(width: 1.r, color: Colors.transparent),
                    ),
                    fillColor: Colors.white,
                    readOnly: true,
                    hintLabel: controller.address.value,
                    prefixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(
                          start: 20.w, end: 16.w, top: 17.h, bottom: 17.h),
                      child: Image.asset(ShtIcons.locationIcon,
                          color: ShtColors.darkGreyColor,
                          width: 14.w,
                          height: 11.h), // myIcon is a 48px-wide widget.
                    ))),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ShtTextInputField(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide:
                              BorderSide(width: 1.r, color: Colors.transparent),
                        ),
                        width: 144.w,
                        fillColor: Colors.white,
                        readOnly: true,
                        hintLabel: 'Date',
                        onTap: () {
                          datepicker();
                        },
                        prefixIcon: Padding(
                          padding: EdgeInsetsDirectional.only(
                              start: 20.w, end: 16.w, top: 17.h, bottom: 17.h),
                          child: Image.asset(ShtIcons.calenderIcon,
                              color: ShtColors.darkGreyColor,
                              width: 14.w,
                              height: 11.h), // myIcon is a 48px-wide widget.
                        )),
                    SizedBox(width: 8.h),
                    ShtTextInputField(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide:
                              BorderSide(width: 1.r, color: Colors.transparent),
                        ),
                        width: 144.w,
                        fillColor: Colors.white,
                        readOnly: true,
                        hintLabel: 'Departure',
                        prefixIcon: Padding(
                          padding: EdgeInsetsDirectional.only(
                              start: 20.w, end: 16.w, top: 17.h, bottom: 17.h),
                          child: Image.asset(ShtIcons.calenderIcon,
                              color: ShtColors.darkGreyColor,
                              width: 14.w,
                              height: 11.h), // myIcon is a 48px-wide widget.
                        )),
                  ],
                ),
                SizedBox(height: 20.h),
                ShtTextInputField(
                  readOnly: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide:
                        BorderSide(width: 1.r, color: Colors.transparent),
                  ),
                  fillColor: Colors.white,
                  keyboardType: TextInputType.number,
                  hintLabel: 'Guests',
                  prefixIcon: Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: 20.w, end: 16.w, top: 17.h, bottom: 17.h),
                    child: Image.asset(ShtIcons.guestIcon,
                        color: ShtColors.darkGreyColor,
                        width: 14.w,
                        height: 11.h), // myIcon is a 48px-wide widget.
                  ),
                  onTap: () {
                    // showDialog(
                    //     context: context,
                    //     builder: ((context) => Dialog(
                    //           backgroundColor: Colors.transparent,
                    //           shape: RoundedRectangleBorder(
                    //               borderRadius: BorderRadius.circular(16.r)),
                    //           child: Container(
                    //             padding: EdgeInsets.symmetric(
                    //                 vertical: 22.h, horizontal: 22.w),
                    //             height: 300,
                    //             decoration: BoxDecoration(
                    //                 color: Colors.white.withOpacity(1),
                    //                 borderRadius: BorderRadius.circular(16.r)),
                    //             child: Column(
                    //               crossAxisAlignment: CrossAxisAlignment.center,
                    //               mainAxisAlignment: MainAxisAlignment.center,
                    //               children: [
                    //                 const ChooseRoom(title: 'Adults'),
                    //                 const ChooseRoom(
                    //                   title: 'Children',
                    //                 ),
                    //                 const ChooseRoom(title: 'Room'),
                    //                 AddSpace.verticle(15.h),
                    //                 ShtButtonWidget(
                    //                   onPressed: () {
                    //                     Navigator.pop(context);
                    //                   },
                    //                   title: 'Done',
                    //                 )
                    //               ],
                    //             ),
                    //           ),
                    //         )));

                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.r),
                                topRight: Radius.circular(30.r))),
                        context: context,
                        builder: (context) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 22.h, horizontal: 22.w),
                            height: 350,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(1),
                                borderRadius: BorderRadius.circular(16.r)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const ChooseRoom(title: 'Adults'),
                                const ChooseRoom(
                                  title: 'Children',
                                ),
                                const ChooseRoom(title: 'Room'),
                                AddSpace.verticle(15.h),
                                ShtButtonWidget(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  title: 'Done',
                                )
                              ],
                            ),
                          );
                        });
                  },
                ),
                SizedBox(height: 32.h),
                ShtButtonWidget(
                    title: 'Search',
                    color: ShtColors.themeColor,
                    height: 48.h,
                    textColor: Colors.white,
                    radius: 10.r,
                    textStyle: const TextStyle(color: Colors.black),
                    onPressed: () {
                      Navigator.pushNamed(
                          context, RoutesName.popularHotelsScreen);
                    }),
              ],
            ),
          )),
    );
  }
}

class ChooseRoom extends StatefulWidget {
  final String? title;
  const ChooseRoom({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  State<ChooseRoom> createState() => _ChooseRoomState();
}

class _ChooseRoomState extends State<ChooseRoom> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Text(widget.title ?? '',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
          const Spacer(),
          Container(
            margin: EdgeInsets.all(5.r),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(width: 1, color: ShtColors.blackColor)),
            child: Row(
              children: [
                TextButton(
                    style: const ButtonStyle(
                      padding:
                          MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.zero),
                    ),
                    onPressed: () {
                      setState(() {
                        if (counter > 0) {
                          counter--;
                        }
                      });
                    },
                    child: const Icon(Icons.remove)),
                const VerticalDivider(
                  width: 2,
                  color: Colors.black,
                ),
                AddSpace.horizontal(16.w),
                Text(
                  counter.toString(),
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
                AddSpace.horizontal(16.w),
                const VerticalDivider(
                  width: 2,
                  color: Colors.black,
                ),
                TextButton(
                    style: const ButtonStyle(
                      padding:
                          MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.zero),
                    ),
                    onPressed: () {
                      setState(() {
                        if (counter >= 0) {
                          counter++;
                        }
                      });
                    },
                    child: const Icon(Icons.add)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
