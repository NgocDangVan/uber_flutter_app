import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rider_uber/constant/utils/colors.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/utils/textStyles.dart';

class ActivityscreenRaider extends StatefulWidget {
  const ActivityscreenRaider({super.key});

  @override
  State<ActivityscreenRaider> createState() => _ActivityscreenRaiderState();
}

class _ActivityscreenRaiderState extends State<ActivityscreenRaider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Uber',
          style: AppTextStyles.heading20Bold,
        ),
      ),
      body: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(
            horizontal: 3.w,
            vertical: 2.h,
          ),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(
                vertical: 1.7.h,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: index == 9 ? transparent : greyShade3,
                  ),
                ),
              ),
              height: 11.8.h,
              width: 94.w,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 0.5.h,
                      horizontal: 1.w,
                    ),
                    height: 8.h,
                    width: 8.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        8.sp,
                      ),
                      color: greyShadeButton,
                      image: const DecorationImage(
                        image: AssetImage('assets/images/vehicle/car.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '33, 2nd Cross Road',
                          style: AppTextStyles.small12Bold,
                          maxLines: 2,
                        ),
                        Text(
                          DateFormat('dd MMM, kk:mm a').format(
                            DateTime.now(),
                          ),
                          style: AppTextStyles.small10.copyWith(color: black87),
                        ),
                        Text(
                          '150:00',
                          style: AppTextStyles.small10.copyWith(color: black87),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
