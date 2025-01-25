

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/constants/appcolors.dart';


class CompanyGallery extends StatelessWidget {
  const CompanyGallery({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 100.w,),
        Text(
          'معرض الشركة',
          style: AppText.fontSizeNormalTextStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Gaps.vGap2,
        SizedBox(
          width: 100.w,
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                  width: 200,
                  height: 150,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: AppColors.boxShadow,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      AppAssets.image,
                      fit: BoxFit.cover,
                    ),
                  )
              ),
              Gaps.hGap2,
              Container(
                  width: 160,
                  height: 130,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: AppColors.boxShadow,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      AppAssets.image,
                      fit: BoxFit.cover,
                    ),
                  )
              ),
            ],
          ),
        ),
      ],
    );
  }
}