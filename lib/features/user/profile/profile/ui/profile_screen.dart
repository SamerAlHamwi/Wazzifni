

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wazzifni/core/constants/app_assets.dart';
import 'package:wazzifni/features/company/apply_job/ui/widgets/cv_widget.dart';
import 'package:wazzifni/features/user/profile/profile/ui/widgets/account_info_widget.dart';
import 'package:wazzifni/features/user/profile/profile/ui/widgets/profile_appbar.dart';
import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/common/style/padding_insets.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/constants/appcolors.dart';
import '../../../../../core/utils/Navigation/Navigation.dart';
import '../../about_me/ui/about_me_screen.dart';
import '../../add_appreciation/ui/add_appreciation_screen.dart';
import '../../add_education/ui/add_education_screen.dart';
import '../../add_education_level/ui/add_education_level_screen.dart';
import '../../add_language/ui/add_language_screen.dart';
import '../../add_language/ui/widgets/languages_list_widget.dart';
import '../../add_resume/ui/add_resume_screen.dart';
import '../../add_skills/ui/add_skills_screen.dart';
import '../../add_skills/ui/widgets/skills_widget.dart';
import '../../add_work_experience/ui/add_work_screen.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ProfileAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: PaddingInsets.normalPaddingAll,
                  child: Column(
                    children: [
                      AccountInfoWidget(
                        title: 'تفاصيل الحساب',
                        iconPath: AppAssets.profileIcon,
                        onTap: () {
                          Navigation.push(const AboutMeScreen());
                        },
                        body: Text(
                          'أنا مصمم مواقع ويب أبتكر واجهات جذابة وعملية، أركز على تجربة المستخدم وأستخدم أحدث التقنيات مثل HTML وCSS وJavaScript لتطوير مواقع متكاملة وفعّالة.',
                          style: AppText.fontSizeNormalTextStyle,
                        ),
                      ),
                      AccountInfoWidget(
                        title: 'السيرة الذاتية',
                        iconPath: AppAssets.cvIcon,
                        onTap: () {
                          Navigation.push(
                              AddResumeScreen(
                                onChanged: (value){

                                },
                              )
                          );
                        },
                        body: CvWidget(isWithDelete: false,),
                      ),
                      AccountInfoWidget(
                        title: 'الخبرة الوظيفية',
                        iconPath: AppAssets.jobIcon,
                        isWithAdd: true,
                        onTap: () {
                          Navigation.push(const AddWorkScreen());
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
                        isWithAdd: true,
                        onTap: () {
                          Navigation.push(const AddEducationScreen());
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
                        onTap: () {
                          Navigation.push(AddEducationLevelScreen());
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
                        onTap: () {
                          Navigation.push(const AddSkillScreen());
                        },
                        body: SkillsWidget(isWithEdit: false, onChanged: (List<int> skills) {  },),
                      ),
                      AccountInfoWidget(
                        title: 'اللغات',
                        iconPath: AppAssets.languageIcon,
                        onTap: () {
                          Navigation.push(AddLanguageScreen());
                        },
                        body: LanguagesListWidget(),
                      ),
                      AccountInfoWidget(
                        title: 'التقديرات',
                        iconPath: AppAssets.goodIcon,
                        onTap: () {
                          Navigation.push(AddAppreciationScreen());
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
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
