

import 'package:flutter/material.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';

import '../../constants/app_textStyle.dart';
import '../../constants/appcolors.dart';

class TitleListWidget extends StatelessWidget {
  const TitleListWidget({super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingInsets.bigPaddingHorizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppText.fontSizeNormalTextStyle.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          TextButton(
              onPressed: onTap,
              child: Text(
                'عرض الكل',
                style: AppText.fontSizeSmallTextStyle.copyWith(
                    color: AppColors.gold
                ),
              )
          )
        ],
      ),
    );
  }
}
