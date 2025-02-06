

import 'package:flutter/material.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/constants/app_textStyle.dart';
import 'package:wazzifni/core/constants/appcolors.dart';
import '../../../../../../core/widgets/image_widgets/custom_image.dart';


class SelectLanguageCard extends StatelessWidget {
  const SelectLanguageCard({super.key,
    required this.title,
    required this.iconPath,
    required this.onTap,
    required this.isSelected,
    required this.onDelete,
  });

  final String title, iconPath;
  final VoidCallback onTap;
  final bool isSelected;
  final Function() onDelete;

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
          gradient: isSelected ? AppColors.primaryGradient : null,
          boxShadow: AppColors.boxShadow,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CustomImage.circular(
                  radius: 40,
                  isNetworkImage: true,
                  image: iconPath,
                ),
                Gaps.hGap2,
                Text(
                  title,
                  style: AppText.fontSizeMediumTextStyle,
                )
              ],
            ),
            isSelected ?
            GestureDetector(
              onTap: (){
                onDelete();
              },
              child: const Icon(
                Icons.delete_outline_outlined,
                color: AppColors.red,
              ),
            ): const SizedBox(),
          ],
        ),
      ),
    );
  }
}
