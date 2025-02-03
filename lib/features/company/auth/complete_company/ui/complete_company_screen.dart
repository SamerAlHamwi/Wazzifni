



import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/constants/app_assets.dart';
import 'package:wazzifni/core/constants/appcolors.dart';
import 'package:wazzifni/core/utils/Navigation/Navigation.dart';
import 'package:wazzifni/features/company/company_home/ui/company_root_screen.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../../core/widgets/custom_widgets/custom_textfield.dart';
import '../../../../../core/widgets/pages/background_page.dart';



class CompleteCompanyAccountScreen extends StatefulWidget {
  const CompleteCompanyAccountScreen({super.key});

  @override
  State<CompleteCompanyAccountScreen> createState() => _CompleteCompanyAccountScreenState();
}

class _CompleteCompanyAccountScreenState extends State<CompleteCompanyAccountScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController aboutController = TextEditingController();


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
              Gaps.vGap5,
              Text(
                'complete_your_info'.tr(),
                style: AppText.fontSizeExtraLargeTextStyle,
              ),
              Gaps.vGap2,
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
                'شركة البراء',
                style: AppText.fontSizeMediumTextStyle.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.vGap4,
              CustomTextField(
                controller: nameController,
                labelText: 'job_type'.tr(),
              ),
              Gaps.vGap2,
              CustomTextField(
                controller: companyController,
                labelText: 'company_location'.tr(),
              ),
              Gaps.vGap2,
              CustomTextField(
                controller: companyController,
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
                          labelText: 'company_establishment_date'.tr()
                      ),
                    ),
                    Gaps.hGap2,
                    Expanded(
                      child: CustomTextField(
                          controller: endController,
                          keyboardType: TextInputType.number,
                          labelText: 'number_of_employees'.tr()
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
              ),
              Gaps.vGap2,
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'company_gallery'.tr(),
                    style: AppText.fontSizeNormalTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.vGap2,
                  Container(
                    width: 200,
                    height: 150,
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: AppColors.boxShadow,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: AppColors.boxShadow,
                      ),
                      child: Center(
                        child: Image.asset(
                          AppAssets.addCamera,
                        ),
                      ),
                    )
                  ),
                ],
              ),
              Gaps.vGap4,
              CustomButton(
                text: 'save_and_continue'.tr(),
                onTap: (){
                  Navigation.pushReplacement(const CompanyRootScreen());
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
