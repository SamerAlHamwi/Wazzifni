

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/common/style/padding_insets.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/constants/appcolors.dart';


class MyRequestsWidget extends StatelessWidget {
  const MyRequestsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingInsets.normalPaddingHorizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'طلباتي',
            style: AppText.fontSizeLargeTextStyle.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          Gaps.vGap2,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 42.w,
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Container(
                  padding: PaddingInsets.cardPaddingHV,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAssets.job,
                        width: 30,
                        height: 25,
                      ),
                      Gaps.vGap1,
                      Text(
                        'عدد الطلبات المقدمة',
                        textAlign: TextAlign.center,
                        style: AppText.fontSizeNormalTextStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor
                        ),
                      ),
                      Text(
                        '12',
                        style: AppText.fontSizeMediumTextStyle.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Gaps.hGap2,
              Container(
                width: 42.w,
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Container(
                  padding: PaddingInsets.cardPaddingHV,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAssets.salary,
                        width: 30,
                        height: 25,
                      ),
                      Gaps.vGap1,
                      Text(
                        'عدد العروض المستلمة',
                        textAlign: TextAlign.center,
                        style: AppText.fontSizeNormalTextStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor
                        ),
                      ),
                      Text(
                        '5',
                        style: AppText.fontSizeMediumTextStyle.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
