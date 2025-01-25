

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/common/style/padding_insets.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/constants/appcolors.dart';


class CvWidget extends StatelessWidget {
  const CvWidget({
    super.key,
    this.isWithDelete = true,
  });

  final bool isWithDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: PaddingInsets.bigPaddingAll,
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        boxShadow: AppColors.boxShadow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                AppAssets.pdf,
                width: 40,
                height: 40,
              ),
              Gaps.hGap2,
              SizedBox(
                width: 60.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "سامر الحموي",
                      style: AppText.fontSizeNormalTextStyle.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.vGap1,
                    Text(
                      '١٤ فبراير ٢٠٢٤ ، ٨٦٧ ك.ب',
                      style: AppText.fontSizeNormalTextStyle.copyWith(
                          color: AppColors.white
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          isWithDelete?
          const Icon(
            Icons.delete_outline_outlined,
            color: AppColors.red,
          ): const SizedBox(),
        ],
      ),
    );
  }
}