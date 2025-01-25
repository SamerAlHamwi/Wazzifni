

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../user/profile/add_language/ui/widgets/languages_list_widget.dart';
import '../../../../user/profile/add_skills/ui/widgets/skills_widget.dart';
import '../../../../user/profile/profile/ui/widgets/account_info_widget.dart';
import '../../../apply_job/ui/widgets/cv_widget.dart';


class UserApplyInfo extends StatelessWidget {
  const UserApplyInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'معلومات الموظف',
          style: AppText.fontSizeNormalTextStyle.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        AccountInfoWidget(
          title: 'تفاصيل الحساب',
          iconPath: AppAssets.profileIcon,
          isWithEdit: false,
          onTap: () {
          },
          body: Text(
            'أنا مصمم مواقع ويب أبتكر واجهات جذابة وعملية، أركز على تجربة المستخدم وأستخدم أحدث التقنيات مثل HTML وCSS وJavaScript لتطوير مواقع متكاملة وفعّالة.',
            style: AppText.fontSizeNormalTextStyle,
          ),
        ),
        AccountInfoWidget(
          title: 'السيرة الذاتية',
          iconPath: AppAssets.cvIcon,
          isWithEdit: false,
          onTap: () {
          },
          body: const CvWidget(isWithDelete: false,),
        ),
        AccountInfoWidget(
          title: 'الخبرة الوظيفية',
          iconPath: AppAssets.jobIcon,
          isWithEdit: false,
          onTap: () {
          },
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 100.w,
              ),
              Text(
                'مدير',
                style: AppText.fontSizeNormalTextStyle.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.vGap1,
              Text(
                'شركة بسكويت',
                style: AppText.fontSizeNormalTextStyle,
              ),
              Text(
                '5 سنوات',
                style: AppText.fontSizeNormalTextStyle,
              ),
            ],
          ),
        ),
        AccountInfoWidget(
          title: 'التعليم',
          iconPath: AppAssets.schoolIcon,
          isWithEdit: false,
          onTap: () {
          },
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 100.w,
              ),
              Text(
                'هندسة المعلوماتية',
                style: AppText.fontSizeNormalTextStyle.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.vGap1,
              Text(
                'جامعة اوكسفورد',
                style: AppText.fontSizeNormalTextStyle,
              ),
              Text(
                '5 سنوات',
                style: AppText.fontSizeNormalTextStyle,
              ),
            ],
          ),
        ),
        AccountInfoWidget(
          title: 'مستوى التعليم',
          iconPath: AppAssets.schoolIcon,
          isWithEdit: false,
          onTap: () {
          },
          body: Row(
            children: [
              Text(
                'ماجستير',
                style: AppText.fontSizeNormalTextStyle,
              ),
            ],
          ),
        ),
        AccountInfoWidget(
          title: 'المهارات',
          iconPath: AppAssets.skillsIcon,
          isWithEdit: false,
          onTap: () {
          },
          body: const SkillsWidget(isWithEdit: false,),
        ),
        AccountInfoWidget(
          title: 'اللغات',
          iconPath: AppAssets.languageIcon,
          isWithEdit: false,
          onTap: () {

          },
          body: LanguagesListWidget(),
        ),
        AccountInfoWidget(
          title: 'التقديرات',
          iconPath: AppAssets.goodIcon,
          isWithEdit: false,
          onTap: () {
          },
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 100.w,
              ),
              Text(
                'دورة فوتوشوب',
                style: AppText.fontSizeNormalTextStyle.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.vGap1,
              Text(
                'معهد نيوهورايزن',
                style: AppText.fontSizeNormalTextStyle,
              ),
              Text(
                '2024-09-18',
                style: AppText.fontSizeNormalTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}