

import 'package:flutter/material.dart';

import '../../../../../../core/common/style/gaps.dart';
import '../../../../../../core/common/style/padding_insets.dart';
import '../../../../../../core/constants/app_textStyle.dart';
import '../../../../../../core/constants/appcolors.dart';



class ProfileInfoWidget extends StatelessWidget {
  const ProfileInfoWidget({super.key, required this.title, required this.iconPath, required this.onTap});

  final String title,iconPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 70,
        padding: PaddingInsets.normalPaddingAll,
        margin: PaddingInsets.lowPaddingVertical,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: AppColors.boxShadow,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset(
                    iconPath,
                    color: AppColors.primaryColor,
                  ),
                ),
                Gaps.hGap2,
                Text(
                  title,
                  style: AppText.fontSizeNormalTextStyle.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Container(
              height: 26,
              width: 26,
              decoration: const BoxDecoration(
                gradient: AppColors.primaryGradient,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add,
                size: 16,
                color: AppColors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
