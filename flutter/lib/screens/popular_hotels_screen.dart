import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tripplnr/components/sht_backclose_widget.dart';
import 'package:tripplnr/components/sht_button_widget.dart';
import 'package:tripplnr/utils/sht_assets.dart';
import 'package:tripplnr/utils/sht_colors.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class PopularHotelsScreen extends StatefulWidget {
  const PopularHotelsScreen({Key? key}) : super(key: key);

  @override
  State<PopularHotelsScreen> createState() => _PopularHotelsScreenState();
}

enum Sort { popular, price, rating, nearby }

class _PopularHotelsScreenState extends State<PopularHotelsScreen> {
  bool isChecked = true;
  void _showSortPopupMenu() {
    showMenu(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      context: context,
      position: RelativeRect.fromLTRB(23.w, 307.h, 300.w, 800.h),
      items: [
        popupMenuItemWidget(Sort.popular, "Popularity", (Sort? value) {
          setState(() {
            groupSort = value;
          });
        }),
        popupMenuItemWidget(Sort.price, "Price (low to high)", (Sort? value) {
          setState(() {
            groupSort = value;
          });
        }),
        popupMenuItemWidget(Sort.rating, "Rating (high to low)", (Sort? value) {
          setState(() {
            groupSort = value;
          });
        }),
        popupMenuItemWidget(Sort.nearby, "Distance (nearby)", (Sort? value) {
          setState(() {
            groupSort = value;
          });
        }),
      ],
      elevation: 8.0,
    );
  }

  Sort? groupSort;
  PopupMenuItem<bool> popupMenuItemWidget(
      Sort selectedValue, String title, Function(Sort?) onChanged) {
    return PopupMenuItem(
      onTap: () {
        setState(() {
          groupSort = selectedValue;
        });
      },
      height: 5.h,
      padding: EdgeInsets.zero,
      value: isChecked,
      child: Row(
        children: [
          Radio<Sort>(
            activeColor: Colors.black,
            value: selectedValue,
            groupValue: groupSort,
            onChanged: onChanged,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(children: [
              Stack(
                children: [
                  Container(
                    height: 250.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage(ShtAssets.loginBg))),
                  ),
                  Positioned(
                      top: 52.h,
                      left: 22.w,
                      child: ShtBackCloseWidget(
                        isSvg: true,
                        iconColor: Colors.white,
                        bgColor: ShtColors.bgListColor.withOpacity(0.19),
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
                margin: EdgeInsets.symmetric(horizontal: 23.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ShtButtonWidget(
                            color: ShtColors.buttonColor,
                            radius: 5.r,
                            height: 25.h,
                            width: 64.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(
                                  ShtIcons.sortIcon,
                                  color: Colors.white,
                                  height: 15.h,
                                ),
                                Text('Sort',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                            onPressed: () {
                              _showSortPopupMenu();
                            }),
                        ShtButtonWidget(
                            color: ShtColors.blackColor,
                            radius: 5.r,
                            height: 25.h,
                            width: 64.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SvgPicture.asset(
                                  ShtIcons.filterIcon,
                                  color: Colors.white,
                                  height: 15.h,
                                ),
                                Text('Filter',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                            onPressed: () {
                              showBarModalBottomSheet(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(26.r),
                                    topRight: Radius.circular(26.r),
                                  )),
                                  topControl: Container(
                                    height: 150.h,
                                  ),
                                  barrierColor: Colors.black.withOpacity(0.40),
                                  backgroundColor: Colors.white,
                                  context: context,
                                  builder: (context) => const FilterWidget());
                            }),
                      ],
                    ),
                    AddSpace.verticle(30.h),
                    Row(
                      children: [
                        SvgPicture.asset(
                          ShtIcons.locationIcon2,
                          height: 20.h,
                          color: ShtColors.lightGreyColor,
                        ),
                        AddSpace.horizontal(7.w),
                        Text('Popular Hotels Nearby',
                            style: TextStyle(
                                color: ShtColors.blackColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                    AddSpace.verticle(14.h),
                    Flexible(
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 20,
                            itemBuilder: ((context, index) =>
                                const ShtHotelNearByWidget())))
                  ],
                ),
              ),
            ])));
  }
}

class FilterWidget extends StatelessWidget {
  const FilterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> hotelStar = [
      '3 Star',
      '5 Star',
    ];
    List<String> propertyType = [
      'Land Area',
      'Resorts',
      'All-suites',
    ];
    List<String> amenities = [
      'Free Wifi',
      'Breakfast Included',
      'Pool',
      'Free Parking'
    ];
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 22.w),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Filters',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: ShtColors.blackColor,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500)),
              ],
            ),
            const MyPriceRangeSlider(),
            TitleWIthChipsSetWidget(
              title: 'Hotel Star',
              chipsList: hotelStar,
            ),
            TitleWIthChipsSetWidget(
              title: 'Property Type',
              radius: 15.r,
              chipsList: propertyType,
            ),
            TitleWIthChipsSetWidget(
              title: 'Amenities',
              chipsList: amenities,
            ),
            AddSpace.verticle(15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ShtButtonWidget(
                    color: ShtColors.blackColor,
                    radius: 5.r,
                    height: 37.h,
                    title: 'Reset',
                    width: 150.w,
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                ShtButtonWidget(
                    color: ShtColors.buttonColor,
                    radius: 5.r,
                    height: 37.h,
                    width: 150.w,
                    title: 'Show Results',
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
            AddSpace.verticle(100.h),
          ],
        ),
      ),
    );
  }
}

// title of filter chips chips
class TitleWIthChipsSetWidget extends StatefulWidget {
  final String? title;
  final List<String>? chipsList;
  final double radius;
  const TitleWIthChipsSetWidget(
      {Key? key, this.title, this.chipsList, this.radius = 5})
      : super(key: key);

  @override
  State<TitleWIthChipsSetWidget> createState() =>
      _TitleWIthChipsSetWidgetState();
}

int? _value = 1;

class _TitleWIthChipsSetWidgetState extends State<TitleWIthChipsSetWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AddSpace.verticle(15.h),
        Text(widget.title ?? "",
            style: TextStyle(
                color: ShtColors.blackColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500)),
        AddSpace.verticle(15.h),
        Wrap(
          spacing: 15.r,
          children: List<Widget>.generate(
            widget.chipsList!.length.toInt(),
            (int index) {
              return ChoiceChip(
                backgroundColor: ShtColors.bgListColor,
                selectedColor: ShtColors.buttonColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(widget.radius)),
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _value == index
                        ? Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 20.r,
                          )
                        : Container(),
                    AddSpace.horizontal(8.w),
                    Text(
                      widget.chipsList![index].toString(),
                      style: TextStyle(
                          color: _value == index ? Colors.white : null),
                    ),
                  ],
                ),
                selected: _value == index,
                onSelected: (bool selected) {
                  setState(() {
                    _value = selected ? index : null;
                  });
                },
              );
            },
          ).toList(),
        )
        // FilterChip(label: Text('3 Star'), onSelected: (value) {})
      ],
    );
  }
}

// Nearby widget
class ShtHotelNearByWidget extends StatelessWidget {
  const ShtHotelNearByWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      height: 100.h,
      padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 14.w),
      decoration: BoxDecoration(
        color: ShtColors.bgListColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Container(
            height: 60.h,
            width: 60.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.white,
              image: DecorationImage(image: AssetImage(ShtAssets.trivago)),
            ),
          ),
          AddSpace.horizontal(11.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('JW Marriot',
                  style: TextStyle(
                      color: ShtColors.blackColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w900)),
              AddSpace.verticle(4.h),
              Text('Double Bed Hotel Room',
                  style: TextStyle(
                      color: ShtColors.lightGreyColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500)),
            ],
          ),
          const Spacer(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 14.w),
            decoration: BoxDecoration(
              color: ShtColors.buttonColor,
              borderRadius: BorderRadius.circular(15.r),
            ),
            height: 45.h,
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '\$560',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // AddSpace.verticle(2.h),
                // Container(
                //   width: 33.w,
                //   height: 1.h,
                //   color: Colors.black,
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Range Slider
class MyPriceRangeSlider extends StatefulWidget {
  const MyPriceRangeSlider({super.key});

  @override
  State<MyPriceRangeSlider> createState() => _MyPriceRangeSliderState();
}

class _MyPriceRangeSliderState extends State<MyPriceRangeSlider> {
  RangeValues _currentRangeValues = const RangeValues(100, 1800);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Price",
            style: TextStyle(
                color: ShtColors.blackColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500)),
        AddSpace.verticle(15.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Min. Price",
                style: TextStyle(
                    color: ShtColors.blackColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500)),
            Text("Max. Price",
                style: TextStyle(
                    color: ShtColors.blackColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500)),
          ],
        ),
        RangeSlider(
          inactiveColor: ShtColors.bgListColor,
          activeColor: ShtColors.buttonColor,
          values: _currentRangeValues,
          max: 2000,
          divisions: 10,
          labels: RangeLabels(
            "\$ ${_currentRangeValues.start.round().toString()}",
            "\$ ${_currentRangeValues.end.round().toString()}",
          ),
          onChanged: (RangeValues values) {
            setState(() {
              _currentRangeValues = values;
            });
          },
        ),
      ],
    );
  }
}
