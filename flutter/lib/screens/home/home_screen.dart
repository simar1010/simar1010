import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tripplnr/components/sht_textinputfield_widget.dart';
import 'package:tripplnr/router/routes_name.dart';
import 'package:tripplnr/utils/sht_assets.dart';

import '../../components/sht_button_widget.dart';
import '../../utils/sht_colors.dart';
import 'home_screen_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

var controller = Get.put<HomeController>(
  HomeController(),
);

class _HomeScreenState extends State<HomeScreen> {
  ScrollController scrollController = ScrollController();
  bool hideSearchBar = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      setState(() {
        hideSearchBar = scrollController.offset > 30;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  List<HotelImageTitleModel> hotels = [
    HotelImageTitleModel(title: 'Appartments', imageUrl: ShtAssets.hotel),
    HotelImageTitleModel(title: 'Corporate Stays', imageUrl: ShtAssets.hotel1),
    HotelImageTitleModel(title: 'Suites', imageUrl: ShtAssets.hotel2),
    HotelImageTitleModel(title: 'Models', imageUrl: ShtAssets.hotel5),
    HotelImageTitleModel(title: 'Homes', imageUrl: ShtAssets.hotel3),
    HotelImageTitleModel(title: 'Models', imageUrl: ShtAssets.hotel6),
    HotelImageTitleModel(title: 'Hotel', imageUrl: ShtAssets.hotel4),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // AddSpace.verticle(120.h),
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: hideSearchBar ? 70 : 120.h,
              ),
              Text('Trip Plnr',
                  style: TextStyle(
                      color: ShtColors.blackColor,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w900)),
              // AddSpace.verticle(24.h),
              AnimatedContainer(
                alignment: Alignment.topCenter,
                duration: const Duration(microseconds: 1000),
                height: hideSearchBar ? 0 : 24.h,
              ),
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: hideSearchBar ? 0 : 50.h,
                child: Row(
                  children: [
                    FittedBox(
                      fit: BoxFit.fill,
                      alignment: Alignment.topLeft,
                      child: ShtTextInputField(
                          fillColor: ShtColors.bgListColor,
                          prefixIcon: const Icon(
                            Icons.search,
                          ),
                          width: 274.w,
                          hintLabel: 'Search'),
                    ),
                    const Spacer(),
                    FittedBox(
                      fit: BoxFit.fill,
                      alignment: Alignment.topLeft,
                      child: ShtButtonWidget(
                        isMinWIdth: true,
                        onPressed: () {},
                        color: ShtColors.themeColor,
                        radius: 5.r,
                        height: 45.h,
                        width: 45.w,
                        padding: EdgeInsets.zero,
                        child: SvgPicture.asset(
                          ShtIcons.filterIcon,
                          color: Colors.white,
                          height: 20.h,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AddSpace.verticle(23.h),
              Flexible(
                child: GridView.builder(
                    controller: scrollController,
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16.h,
                      crossAxisSpacing: 15.w,
                    ),
                    itemCount: hotels.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RoutesName.popularHotelsScreen);
                        },
                        child: Container(
                          padding: EdgeInsets.all(15.h),
                          height: 186.h,
                          width: 158.w,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.7),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(hotels[index].imageUrl)),
                              borderRadius: BorderRadius.circular(16.r)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                // title
                                hotels[index].title,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          )),
    );
  }
}
