

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/constants/app_assets.dart';
import 'package:wazzifni/features/company/company_profile/ui/widgets/about_company_widget.dart';
import 'package:wazzifni/features/company/company_profile/ui/widgets/company_gallery.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/constants/appcolors.dart';
import '../../../../../core/widgets/pages/background_page.dart';
import 'widgets/company_info_widget.dart';


class CompanyProfile extends StatelessWidget {
  const CompanyProfile({super.key});

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
              Container(
                width: 200,
                padding: PaddingInsets.bigPaddingAll,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: AppColors.boxShadow
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets.google,
                    ),
                    Gaps.vGap1,
                    Text(
                      'شركة البراء',
                      style: AppText.fontSizeLargeTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Gaps.vGap2,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CompanyInfoBox(
                    title: 'number_of_employees'.tr(),
                    subTitle: '٣٣ موظف',
                  ),
                  Gaps.hGap2,
                  CompanyInfoBox(
                    title: 'company_location'.tr(),
                    subTitle: 'بغداد،العراق',
                  ),
                  Gaps.hGap2,
                  CompanyInfoBox(
                    title: 'company_establishment_date'.tr(),
                    subTitle: '1998',
                  ),
                ],
              ),
              Gaps.vGap2,
              //Company
              const AboutCompany(),
              Gaps.vGap2,
              //Website
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 100.w,),
                  Text(
                    'company_website2'.tr(),
                    style: AppText.fontSizeMediumTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.vGap1,
                  Text(
                    'https://www.google.com',
                    style: AppText.fontSizeNormalTextStyle.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              Gaps.vGap2,
              //Spec
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 100.w,),
                  Text(
                    'company_specialization'.tr(),
                    style: AppText.fontSizeMediumTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.vGap1,
                  Text(
                    'تكنولوجيا البحث، الحوسبة على شبكة الانترنت، البرمجيات والإعلان عبر الانترنت',
                    style: AppText.fontSizeNormalTextStyle,
                  ),
                ],
              ),
              Gaps.vGap2,
              const CompanyGallery(),
            ],
          ),
        ),
      ),
    );
  }
}






