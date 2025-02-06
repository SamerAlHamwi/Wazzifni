

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/constants/app_assets.dart';
import 'package:wazzifni/core/constants/appcolors.dart';
import 'package:wazzifni/core/utils/Navigation/Navigation.dart';
import 'package:wazzifni/core/utils/utils.dart';
import 'package:wazzifni/features/user/auth/complete_account/ui/widget/profile_info_widget.dart';
import 'package:wazzifni/features/user/privacy_policy/ui/privacy_policy_screen.dart';
import '../../../../../core/boilerplate/create_model/cubits/create_model_cubit.dart';
import '../../../../../core/boilerplate/create_model/widgets/create_model.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../../core/widgets/image_widgets/profile_image.dart';
import '../../../../../core/widgets/pages/background_page.dart';
import '../../../profile/about_me/ui/about_me_screen.dart';
import '../../../profile/add_appreciation/ui/add_appreciation_screen.dart';
import '../../../profile/add_education/ui/add_education_screen.dart';
import '../../../profile/add_language/ui/add_language_screen.dart';
import '../../../profile/add_resume/ui/add_resume_screen.dart';
import '../../../profile/add_skills/ui/add_skills_screen.dart';
import '../../../profile/add_work_experience/ui/add_work_screen.dart';
import '../../login/data/model/language_model.dart';
import '../../login/data/repository/auth_repository.dart';
import '../../login/data/use_case/create_profile_use_case.dart';
import '../../login/data/use_case/login_use_case.dart';
import '../data/model/award_model.dart';
import '../data/model/education_model.dart';
import '../data/model/work_experiences_model.dart';

class CompleteAccountScreen extends StatefulWidget {
  const CompleteAccountScreen({super.key, required this.loginParams});

  final LoginParams loginParams;

  @override
  State<CompleteAccountScreen> createState() => _CompleteAccountScreenState();
}

class _CompleteAccountScreenState extends State<CompleteAccountScreen> with AutomaticKeepAliveClientMixin {
  String? aboutMe;
  String? cvPath;
  WorkExperiencesModel? workExperiencesModel;
  AwardModel? awardModel;
  EducationModel? educationModel;
  List<int> selectedSkills = [];
  List<LanguageModel> languages = [];
  String imagePath = '';
  late CreateModelCubit profileCubit;

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
              ProfileImageWidget(
                  onChanged: (value){
                    imagePath = value;
                  }
              ),
              Gaps.vGap2,
              Text(
                widget.loginParams.fullName ?? '',
                style: AppText.fontSizeMediumTextStyle.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.vGap4,
              ProfileInfoWidget(
                title: 'account_info'.tr(),
                iconPath: AppAssets.profileIcon,
                onTap: () async {
                  aboutMe = await Navigation.push(AboutMeScreen(aboutMe: aboutMe,));
                },
              ),
              ProfileInfoWidget(
                title: 'cv'.tr(),
                iconPath: AppAssets.cvIcon,
                onTap: () {
                  Navigation.push(
                    AddResumeScreen(
                      onChanged: (value) {
                        cvPath = value;
                      },
                    ),
                  );
                },
              ),
              ProfileInfoWidget(
                title: 'experience'.tr(),
                iconPath: AppAssets.jobIcon,
                onTap: () async {
                  workExperiencesModel = await Navigation.push(AddWorkScreen(workModel: workExperiencesModel,));
                },
              ),
              ProfileInfoWidget(
                title: 'education'.tr(),
                iconPath: AppAssets.schoolIcon,
                onTap: () async {
                  educationModel = await Navigation.push(AddEducationScreen(educationModel: educationModel));
                },
              ),
              ProfileInfoWidget(
                title: 'skills'.tr(),
                iconPath: AppAssets.skillsIcon,
                onTap: () async {
                  selectedSkills = await Navigation.push(AddSkillScreen(selectedSkills: selectedSkills,));
                },
              ),
              ProfileInfoWidget(
                title: 'languages'.tr(),
                iconPath: AppAssets.languageIcon,
                onTap: () async {
                  languages.addAll(await Navigation.push(AddLanguageScreen(languages: languages)) ?? []);
                },
              ),
              ProfileInfoWidget(
                title: 'awards'.tr(),
                iconPath: AppAssets.goodIcon,
                onTap: () async {
                  awardModel = await Navigation.push(AddAppreciationScreen(awardModel: awardModel,));
                },
              ),
              Gaps.vGap4,
              CreateModel(
                onCubitCreated: (cubit) => profileCubit = cubit,
                useCaseCallBack: (model) {
                  return CreateUserProfileUseCase(AuthRepository()).call(
                    params: model,
                  );
                },
                onSuccess: (model) {
                  Navigation.pushReplacement(PrivacyPolicyScreen());
                },
                withValidation: false,
                child: CustomButton(
                  text: 'save_and_continue'.tr(),
                  onTap: () {
                    if(checkAllData()){
                      profileCubit.createModel(
                        requestData: CreateUserProfileParams(
                            about: aboutMe!,
                            cityId: widget.loginParams.cityId!,
                            educations: [educationModel!],
                            workExperiences: [workExperiencesModel!],
                            awards: [awardModel!],
                            spokenLanguages: languages,
                            skillIds: selectedSkills,
                            cvPath: cvPath,
                            profilePhotoPath: imagePath,
                        ),
                      );
                    }
                  },
                ),
              ),
              Gaps.vGap4,
            ],
          ),
        ),
      ),
    );
  }

  checkAllData(){
    if(aboutMe == null){
      Utils.showToast('please_add_about'.tr());
      return false;
    }
    if(cvPath == null){
      Utils.showToast('please_add_cv'.tr());
      return false;
    }
    if(workExperiencesModel == null){
      Utils.showToast('please_add_work'.tr());
      return false;
    }
    if(educationModel == null){
      Utils.showToast('please_select_education_level'.tr());
      return false;
    }
    if(awardModel == null){
      Utils.showToast('please_add_award'.tr());
      return false;
    }
    if(selectedSkills.isEmpty){
      Utils.showToast('please_add_skills'.tr());
      return false;
    }
    if(languages.isEmpty){
      Utils.showToast('please_add_language'.tr());
      return false;
    }
    if(imagePath.isEmpty){
      Utils.showToast('please_add_image'.tr());
      return false;
    }
    return true;
  }

  @override
  bool get wantKeepAlive => true;
}
