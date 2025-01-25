

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/constants/app_assets.dart';
import 'package:wazzifni/features/company/apply_job/ui/add_cv_screen.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/constants/appcolors.dart';
import '../../../../../core/widgets/pages/background_page.dart';
import '../../../../core/utils/Navigation/Navigation.dart';
import '../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../company_profile/ui/widgets/company_info_widget.dart';
import 'widgets/job_description.dart';
import 'widgets/job_header_widget.dart';


class CompanyJobDetails extends StatelessWidget {
  const CompanyJobDetails({super.key});

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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_outlined, color: AppColors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              Gaps.vGap2,
              const JobHeaderWidget(),
              Gaps.vGap2,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CompanyInfoBox(
                    title: 'الموقع الوظيفي',
                    subTitle: 'محترف',
                    iconPath: AppAssets.job,
                  ),
                  Gaps.hGap2,
                  const CompanyInfoBox(
                    title: 'نوع الوظيفة',
                    subTitle: 'دوام كامل',
                    iconPath: AppAssets.caseIcon,
                  ),
                  Gaps.hGap2,
                  const CompanyInfoBox(
                    title: 'الراتب',
                    subTitle: '1000\$',
                    iconPath: AppAssets.salary,
                  ),
                ],
              ),
              Gaps.vGap2,
              //Company
              const JobDescription(),
              Gaps.vGap2,
              //Address
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 100.w,),
                  Text(
                    'الموقع',
                    style: AppText.fontSizeMediumTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.vGap1,
                  Text(
                    'بغداد، العراق',
                    style: AppText.fontSizeNormalTextStyle,
                  ),
                ],
              ),
              Gaps.vGap2,
              Image.asset(
                AppAssets.map,
                width: 100.w,
                fit: BoxFit.cover,
              ),
              Gaps.vGap2,
              Row(
                children: [
                  Text(
                    'معلومات إضافية',
                    style: AppText.fontSizeLargeTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Gaps.vGap1,
              //Cert
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 100.w,),
                  Text(
                    'الشهادة',
                    style: AppText.fontSizeMediumTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.vGap1,
                  Text(
                    'بكالوريوس',
                    style: AppText.fontSizeNormalTextStyle,
                  ),
                ],
              ),
              Gaps.vGap1,
              Container(
                width: 75.w,
                height: 0.5,
                color: AppColors.grey,
              ),
              Gaps.vGap1,
              //Experience
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 100.w,),
                  Text(
                    'الخبرة',
                    style: AppText.fontSizeMediumTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.vGap1,
                  Text(
                    'ثلاث سنوات',
                    style: AppText.fontSizeNormalTextStyle,
                  ),
                ],
              ),
              Gaps.vGap2,
              CustomButton(
                text: 'تقدم الآن',
                onTap: (){
                  Navigation.push(const ApplyCvScreen());
                },
              ),
              Gaps.vGap2,
            ],
          ),
        ),
      ),
    );
  }
}








