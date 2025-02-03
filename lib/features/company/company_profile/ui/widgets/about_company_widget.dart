

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/style/padding_insets.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/constants/appcolors.dart';


class AboutCompany extends StatelessWidget {
  const AboutCompany({
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
                'company_info'.tr(),
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
                  'تأسست شركتنا على رؤية طموحة تهدف إلى تقديم حلول مبتكرة تلبي احتياجات العملاء وتساهم في تحسين جودة الحياة. نحن نؤمن بأن الابتكار والتفاني في العمل هما مفتاح النجاح، ونلتزم بتقديم خدمات ومنتجات ذات جودة عالية تتوافق مع أعلى المعايير العالمية. مع سنوات من الخبرة في مجالنا، قمنا ببناء سمعة قوية كشريك موثوق به للعملاء في مختلف القطاعات. نعمل جاهدين على تطوير بيئة عمل إيجابية ومشجعة للفريق، مما يمكننا من تقديم أداء متميز وتحقيق أهدافنا بفعالية.',
                  style: AppText.fontSizeNormalTextStyle
              ),
            ),
          ),
        ],
      ),
    );
  }
}
