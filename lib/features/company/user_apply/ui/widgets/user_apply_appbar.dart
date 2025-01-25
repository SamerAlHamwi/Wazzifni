

import 'package:flutter/material.dart';

import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/common/style/padding_insets.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/constants/appcolors.dart';

class UserApplyAppBar extends StatelessWidget {
  const UserApplyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
          boxShadow: AppColors.boxShadow,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          )
      ),
      child: Padding(
        padding: PaddingInsets.bigPaddingHV,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.vGap5,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColors.primaryColor,
                      backgroundImage: AssetImage(
                        AppAssets.companyLogo,
                      ),
                    ),
                    Gaps.hGap2,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'سامر الحموي',
                          style: AppText.fontSizeNormalTextStyle.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.white
                          ),
                        ),
                        Text(
                          'بغداد، العراق',
                          style: AppText.fontSizeSmallTextStyle.copyWith(
                              color: AppColors.white
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  'منذ ساعتين',
                  style: AppText.fontSizeSmallTextStyle.copyWith(
                      color: AppColors.white
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