

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/common/style/padding_insets.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/constants/appcolors.dart';


class CompanyInfoBox extends StatelessWidget {
  const CompanyInfoBox({
    super.key, required this.title, required this.subTitle, this.iconPath = '',
  });

  final String title,subTitle;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25.w,
      height: iconPath.isNotEmpty ? 100 : 75,
      padding: PaddingInsets.normalPaddingAll,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: AppColors.boxShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(iconPath.isNotEmpty)
            SizedBox(
              height: 25,
                width: 25,
                child: Image.asset(iconPath)),

          Gaps.vGap2,
          Text(
            title,
            style: AppText.fontSizeSmallTextStyle.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          Gaps.vGap1,
          Text(
            subTitle,
            style: AppText.fontSizeNormalTextStyle.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}