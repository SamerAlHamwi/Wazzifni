

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/constants/app_assets.dart';
import 'package:wazzifni/core/constants/app_textStyle.dart';
import 'package:wazzifni/core/constants/appcolors.dart';
import 'package:wazzifni/core/utils/Navigation/Navigation.dart';
import 'package:wazzifni/core/widgets/custom_widgets/custom_button.dart';

import '../application_details_screen.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String description;
  final String time;
  final IconData logo;

  const NotificationCard({super.key,
    required this.title,
    required this.description,
    required this.time,
    required this.logo,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigation.push(const ApplicationDetailsScreen());
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: AppColors.boxShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    AppAssets.companyLogo,
                    width: 50,
                    height: 50,
                  ),
                ),
                Gaps.hGap2,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gaps.vGap2,
                      Text(
                        title,
                        style: AppText.fontSizeMediumTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                        )
                      ),
                      Gaps.vGap1,
                      SizedBox(
                        width: 70.w,
                        child: Text(
                          description,
                          style: AppText.fontSizeNormalTextStyle
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Gaps.vGap2,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  time,
                    style: AppText.fontSizeNormalTextStyle.copyWith(
                      color: AppColors.grey
                    )
                ),
                CustomButton(
                  text: 'التفاصيل',
                  width: 30.w,
                  height: 35,
                  onTap: (){

                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}