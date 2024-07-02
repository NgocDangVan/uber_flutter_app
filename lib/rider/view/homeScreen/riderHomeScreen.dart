import 'package:flutter/material.dart';
import 'package:rider_uber/constant/utils/colors.dart';
import 'package:rider_uber/constant/utils/textStyles.dart';
import 'package:sizer/sizer.dart';

class Riderhomescreen extends StatefulWidget {
  const Riderhomescreen({super.key});

  @override
  State<Riderhomescreen> createState() => _RiderhomescreenState();
}

class _RiderhomescreenState extends State<Riderhomescreen> {
  List suggestions = [
    ['assets/images/suggestions/trip.png', 'Trip'],
    ['assets/images/suggestions/rentals.png', 'Rentals'],
    ['assets/images/suggestions/reserve.png', 'Reserve'],
    ['assets/images/suggestions/intercity.png', 'Intercity']
  ];

  List moreWaysToUber = [
    [
      'assets/images/moreWaysUber/premierTrips.png',
      'Premier Strips',
      'Top-rated driver, newer card',
    ],
    [
      'assets/images/moreWaysUber/safetyToolKit.png',
      'Safety Toolkit',
      'On-trip help with safety issues',
    ],
    [
      'assets/images/moreWaysUber/sendAPackage.png',
      'Send a package',
      'On demand delivery across town',
    ],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Uber',
          style: AppTextStyles.heading20Bold,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          //Where to Button
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.sp),
                  color: greyShade3),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: black87,
                    size: 4.h,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    'Where to?',
                    style: AppTextStyles.body14Bold,
                  )
                ],
              ),
            ),
          ),
          // Previous page Record
          ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 0.5.h),
                padding: EdgeInsets.symmetric(vertical: 0.5.h),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 3.h,
                      backgroundColor: greyShade3,
                      child: Icon(
                        Icons.location_on,
                        color: black,
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Main address',
                          style: AppTextStyles.body14Bold,
                        ),
                        Text(
                          'Main address description',
                          style: AppTextStyles.small10.copyWith(color: black38),
                        )
                      ],
                    )),
                    SizedBox(width: 3.w),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: greyShade3,
                      size: 15.sp,
                    )
                  ],
                ),
              );
            },
          ),
          //Suggestion
          SizedBox(
            height: 4.h,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Suggestions',
                    style: AppTextStyles.body14Bold,
                  ),
                  Text(
                    'See all',
                    style: AppTextStyles.small10.copyWith(color: black87),
                  )
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: suggestions
                    .map((e) => SizedBox(
                          width: 20.w,
                          height: 20.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 15.w,
                                width: 20.w,
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.sp),
                                    color: greyShadeButton),
                                child: Image(
                                  image: AssetImage(e[0]),
                                ),
                              ),
                              Text(
                                e[1],
                                style: AppTextStyles.small10Bold
                                    .copyWith(color: black87),
                              )
                            ],
                          ),
                        ))
                    .toList(),
              )
            ],
          ),
          //Banner
          SizedBox(
            height: 2.h,
          ),
          const Image(
            image: AssetImage(
              'assets/images/promotion/promo.png',
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'More ways to use Uber',
                style: AppTextStyles.body14Bold,
              ),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                height: 20.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: moreWaysToUber.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                          left: index == 0 ? 0 : 1.5.w,
                          right:
                              index == (moreWaysToUber.length - 1) ? 0 : 1.5.w),
                      height: 18.w,
                      width: 65.w,
                      child: Column(
                        children: [
                          Container(
                            height: 15.w,
                            width: 65.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.sp),
                              image: DecorationImage(
                                image: AssetImage(moreWaysToUber[index][0]),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
