

import 'package:flutter/material.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/constants/app_textStyle.dart';
import 'package:wazzifni/core/constants/appcolors.dart';


class PrivacyPolicyItem extends StatelessWidget {
  const PrivacyPolicyItem({super.key, required this.title, required this.description});

  final String title,description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingInsets.normalPaddingVertical,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 40,
            decoration: const BoxDecoration(
              gradient: AppColors.blueGradient,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                  title,
                style: AppText.fontSizeNormalTextStyle.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: AppColors.boxShadow,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: PaddingInsets.normalPaddingAll,
              child: Text(
                description,
                style: AppText.fontSizeNormalTextStyle
              ),
            ),
          ),
        ],
      ),
    );
  }
}
