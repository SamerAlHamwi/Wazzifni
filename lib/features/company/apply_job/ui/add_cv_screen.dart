

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/constants/app_assets.dart';
import 'package:wazzifni/core/utils/Navigation/Navigation.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/constants/appcolors.dart';
import '../../../../../core/widgets/pages/background_page.dart';
import '../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../core/widgets/custom_widgets/custom_textfield.dart';
import '../../../user/profile/add_resume/ui/add_resume_screen.dart';
import '../../company_job_details/ui/widgets/job_header_widget.dart';
import 'add_cv_screen2.dart';


class ApplyCvScreen extends StatelessWidget {
  const ApplyCvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
      body: SingleChildScrollView(
        child: Padding(
          padding: PaddingInsets.extraBigPaddingAll,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
              const JobHeaderWidget(),
              Gaps.vGap2,
              Text(
                'upload_cv'.tr(),
                style: AppText.fontSizeMediumTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.vGap1,
              Text(
                'cv_info'.tr(),
                style: AppText.fontSizeNormalTextStyle,
              ),
              Gaps.vGap2,
              Center(
                child: CustomPaint(
                  painter: DashedBorderPainter(),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppAssets.uploadCV,
                          width: 40,
                          height: 40,
                        ),
                        Gaps.hGap2,
                        Text(
                            'upload_cv'.tr(),
                            style: AppText.fontSizeNormalTextStyle
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Gaps.vGap4,
              Text(
                'extra_info'.tr(),
                style: AppText.fontSizeMediumTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.vGap1,
              CustomTextField(
                controller: TextEditingController(),
                maxLines: 5,
                hintText: 'explain_why'.tr(),
              ),
              Gaps.vGap4,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: 'apply_now'.tr(),
                    onTap: (){
                      Navigation.push(const ApplyCv2Screen());
                    },
                  ),
                ],
              ),
              Gaps.vGap2,
            ],
          ),
        ),
      ),
    );
  }
}








