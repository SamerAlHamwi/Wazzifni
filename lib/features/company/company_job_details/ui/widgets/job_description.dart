

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/common/style/padding_insets.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/constants/appcolors.dart';


class JobDescription extends StatelessWidget {
  const JobDescription({
    super.key,
  });

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
                'job_info'.tr(),
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
                  'نبحث عن مصمم مواقع إلكترونية موهوب ومبدع للانضمام إلى فريقنا. سيكون المصمم مسؤولاً عن تصميم واجهات مواقع إلكترونية جذابة وسهلة الاستخدام، مع التركيز على تحسين تجربة المستخدم (UX) وضمان التوافق مع مختلف الأجهزة والشاشات.',
                  style: AppText.fontSizeNormalTextStyle
              ),
            ),
          ),
        ],
      ),
    );
  }
}
