

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/constants/app_assets.dart';
import 'package:wazzifni/core/constants/appcolors.dart';
import 'package:wazzifni/core/utils/Navigation/Navigation.dart';
import 'package:wazzifni/features/user/auth/complete_account/ui/widget/profile_info_widget.dart';
import 'package:wazzifni/features/user/home/ui/root_screen.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../../core/widgets/pages/background_page.dart';
import '../../../profile/about_me/ui/about_me_screen.dart';
import '../../../profile/add_appreciation/ui/add_appreciation_screen.dart';
import '../../../profile/add_education/ui/add_education_screen.dart';
import '../../../profile/add_education_level/ui/add_education_level_screen.dart';
import '../../../profile/add_language/ui/add_language_screen.dart';
import '../../../profile/add_resume/ui/add_resume_screen.dart';
import '../../../profile/add_skills/ui/add_skills_screen.dart';
import '../../../profile/add_work_experience/ui/add_work_screen.dart';



class CompleteAccountScreen extends StatefulWidget {
  const CompleteAccountScreen({super.key});

  @override
  State<CompleteAccountScreen> createState() => _CompleteAccountScreenState();
}

class _CompleteAccountScreenState extends State<CompleteAccountScreen> {


  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
      body: SingleChildScrollView(
        child: Padding(
          padding: PaddingInsets.extraBigPaddingAll,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gaps.vGap4,
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  shape: BoxShape.circle,
                  boxShadow: AppColors.boxShadow,
                ),
                child: Image.asset(
                  AppAssets.cameraIcon,
                ),
              ),
              Gaps.vGap2,
              Text(
                'سامر الحموي',
                style: AppText.fontSizeMediumTextStyle.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.vGap4,
              ProfileInfoWidget(
                title: 'account_info'.tr(),
                iconPath: AppAssets.profileIcon,
                onTap: () {
                  Navigation.push(const AboutMeScreen());
                },
              ),
              ProfileInfoWidget(
                title: 'cv'.tr(),
                iconPath: AppAssets.cvIcon,
                onTap: () {
                  Navigation.push(const AddResumeScreen());
                },
              ),
              ProfileInfoWidget(
                title: 'experience'.tr(),
                iconPath: AppAssets.jobIcon,
                onTap: () {
                  Navigation.push(AddWorkScreen());
                },
              ),
              ProfileInfoWidget(
                title: 'education'.tr(),
                iconPath: AppAssets.schoolIcon,
                onTap: () {
                  Navigation.push(AddEducationScreen());
                },
              ),
              ProfileInfoWidget(
                title: 'education_level'.tr(),
                iconPath: AppAssets.schoolIcon,
                onTap: () {
                  Navigation.push(AddEducationLevelScreen());
                },
              ),
              ProfileInfoWidget(
                title: 'skills'.tr(),
                iconPath: AppAssets.skillsIcon,
                onTap: () {
                  Navigation.push(const AddSkillScreen());
                },
              ),
              ProfileInfoWidget(
                title: 'languages'.tr(),
                iconPath: AppAssets.languageIcon,
                onTap: () {
                  Navigation.push(AddLanguageScreen());
                },
              ),
              ProfileInfoWidget(
                title: 'awards'.tr(),
                iconPath: AppAssets.goodIcon,
                onTap: () {
                  Navigation.push(AddAppreciationScreen());
                },
              ),
              Gaps.vGap4,
              CustomButton(
                text: 'save_and_continue'.tr(),
                onTap: (){
                  Navigation.pushReplacement(const UserRootScreen());
                },
              ),
              Gaps.vGap4,
            ],
          ),
        ),
      ),
    );
  }
}
