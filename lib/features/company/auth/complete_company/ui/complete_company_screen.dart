



import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wazzifni/core/common/models/translations_model.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/constants/app_assets.dart';
import 'package:wazzifni/core/constants/appcolors.dart';
import 'package:wazzifni/core/utils/Navigation/Navigation.dart';
import 'package:wazzifni/features/company/auth/complete_company/ui/widgets/company_gallery_widget.dart';
import 'package:wazzifni/features/company/company_home/ui/company_root_screen.dart';
import 'package:wazzifni/features/user/privacy_policy/ui/privacy_policy_screen.dart';
import '../../../../../core/boilerplate/create_model/cubits/create_model_cubit.dart';
import '../../../../../core/boilerplate/create_model/widgets/create_model.dart';
import '../../../../../core/constants/Validators.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../../core/widgets/custom_widgets/custom_textfield.dart';
import '../../../../../core/widgets/image_widgets/profile_image.dart';
import '../../../../../core/widgets/pages/background_page.dart';
import '../../../../user/auth/login/data/repository/auth_repository.dart';
import '../../../../user/auth/login/data/use_case/login_use_case.dart';
import '../data/model/company_model.dart';
import '../data/use_case/create_company_use_case.dart';



class CompleteCompanyAccountScreen extends StatefulWidget {
  const CompleteCompanyAccountScreen({super.key, required this.loginParams});

  final LoginParams loginParams;

  @override
  State<CompleteCompanyAccountScreen> createState() => _CompleteCompanyAccountScreenState();
}

class _CompleteCompanyAccountScreenState extends State<CompleteCompanyAccountScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController companyLocationController = TextEditingController();
  TextEditingController companyWebsiteController = TextEditingController();
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  String imagePath = '';
  List<String> companyGallery = [];

  late CreateModelCubit signUpCubit;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
      body: SingleChildScrollView(
        child: Padding(
          padding: PaddingInsets.extraBigPaddingAll,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gaps.vGap5,
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
                Text(
                  'complete_your_info'.tr(),
                  style: AppText.fontSizeExtraLargeTextStyle,
                ),
                Gaps.vGap2,
                CustomTextField(
                  controller: nameController,
                  labelText: 'job_type'.tr(),
                  validator: Validators.validateEmptyValue,
                ),
                Gaps.vGap2,
                CustomTextField(
                  controller: companyLocationController,
                  labelText: 'company_location'.tr(),
                  validator: Validators.validateEmptyValue,
                ),
                Gaps.vGap2,
                CustomTextField(
                  controller: companyWebsiteController,
                  labelText: 'company_website'.tr(),
                ),
                Gaps.vGap2,
                SizedBox(
                  width: 100.w,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: CustomTextField(
                            controller: startController,
                            keyboardType: TextInputType.number,
                            labelText: 'company_establishment_date'.tr(),
                          validator: Validators.validateEmptyValue,
                        ),
                      ),
                      Gaps.hGap2,
                      Expanded(
                        child: CustomTextField(
                            controller: endController,
                            keyboardType: TextInputType.number,
                            labelText: 'number_of_employees'.tr(),
                          validator: Validators.validateEmptyValue,
                        ),
                      ),
                    ],
                  ),
                ),
                Gaps.vGap2,
                CustomTextField(
                    controller: aboutController,
                    labelText: 'company_info'.tr(),
                    maxLines: 6,
                  validator: Validators.validateEmptyValue,
                ),
                Gaps.vGap2,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100.w,
                    ),
                    Text(
                      'company_gallery'.tr(),
                      style: AppText.fontSizeNormalTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.vGap2,
                    CompanyGalleryWidget(
                      imagePaths: companyGallery,
                      onChanged: (images) {
                        setState(() {
                          companyGallery = images;
                        });
                      },
                    ),
                  ],
                ),
                Gaps.vGap4,
                CreateModel(
                  onCubitCreated: (cubit) => signUpCubit = cubit,
                  useCaseCallBack: (model) {
                    return CreateCompanyUseCase(AuthRepository()).call(
                      params: model,
                    );
                  },
                  onSuccess: (CompanyModel model) {
                    Navigation.pushReplacement(PrivacyPolicyScreen(isCompany: true,));
                  },
                  withValidation: false,
                  child: CustomButton(
                    text: 'save_and_continue'.tr(),
                    onTap: () {
                      if(_formKey.currentState!.validate()){
                        if(imagePath.isEmpty && companyGallery.isEmpty){

                          return;
                        }
                        CreateCompanyParams params = CreateCompanyParams(
                          translations: [
                            Translations(
                              name: widget.loginParams.fullName,
                              language: 'ar',
                              address: companyLocationController.text.trim(),
                              about: aboutController.text.trim(),
                            ),
                          ],
                          cityId: widget.loginParams.cityId,
                          numberOfEmployees: int.parse(endController.text),
                          dateOfEstablishment: DateTime(int.parse(startController.text)),
                          jobType: nameController.text.trim(),
                          webSite: companyWebsiteController.text.trim(),
                          profileImagePath: imagePath,
                          images: companyGallery,
                        );
                        signUpCubit.createModel(
                          requestData: params,
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
      ),
    );
  }
}


