

import 'package:flutter/material.dart';
import 'package:wazzifni/core/utils/Navigation/Navigation.dart';
import 'package:wazzifni/features/company/company_profile/ui/company_profile_screen.dart';
import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/common/style/padding_insets.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/constants/appcolors.dart';


class JobHeaderWidget extends StatelessWidget {
  const JobHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigation.push(const CompanyProfile());
      },
      child: Container(
        width: double.infinity,
        padding: PaddingInsets.bigPaddingAll,
        decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(12),
            boxShadow: AppColors.boxShadow
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '#1234',
                  style: AppText.fontSizeNormalTextStyle.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            Gaps.vGap1,
            Image.asset(
              AppAssets.google,
            ),
            Gaps.vGap1,
            Text(
              'مصمم مواقع احترافي',
              style: AppText.fontSizeLargeTextStyle.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            Gaps.vGap1,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'شركة البراء',
                  style: AppText.fontSizeNormalTextStyle.copyWith(
                    color: AppColors.white,
                  ),
                ),
                Text(
                  'منذ يوم',
                  style: AppText.fontSizeNormalTextStyle.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}