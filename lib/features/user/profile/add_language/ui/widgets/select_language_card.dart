

import 'package:flutter/material.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/constants/app_textStyle.dart';
import 'package:wazzifni/core/constants/appcolors.dart';


class SelectLanguageCard extends StatelessWidget {
  const SelectLanguageCard({super.key,
    required this.title,
    required this.iconPath,
    required this.onTap,
  });

  final String title, iconPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        padding: PaddingInsets.normalPaddingHV,
        margin: PaddingInsets.subLowPaddingVertical,
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: AppColors.boxShadow,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Image.asset(
              iconPath,
              width: 35,
              height: 35,
            ),
            Gaps.hGap2,
            Text(
              title,
              style: AppText.fontSizeNormalTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
