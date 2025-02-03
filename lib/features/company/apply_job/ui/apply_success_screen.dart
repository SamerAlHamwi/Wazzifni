

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/constants/app_assets.dart';
import 'package:wazzifni/features/user/home/ui/root_screen.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/constants/appcolors.dart';
import '../../../../../core/widgets/pages/background_page.dart';
import '../../../../core/utils/Navigation/Navigation.dart';
import '../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../company_job_details/ui/widgets/job_header_widget.dart';


class ApplySuccessScreen extends StatelessWidget {
  const ApplySuccessScreen({super.key});

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
              const JobHeaderWidget(),
              Gaps.vGap2,
              Image.asset(
                AppAssets.success,
                width: 40.w,
                height: 40.w,
              ),
              Text(
                'success'.tr(),
                style: AppText.fontSizeMediumTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.vGap2,
              Text(
                'request_sent'.tr(),
                style: AppText.fontSizeNormalTextStyle,
              ),
              Gaps.vGap4,
              CustomButton(
                text: 'find_similar'.tr(),
                isSecondaryGradient: true,
                onTap: (){
                  Navigation.push(const UserRootScreen());
                },
              ),
              Gaps.vGap2,
              CustomButton(
                text: 'back_to_home'.tr(),
                onTap: (){
                  Navigation.push(const UserRootScreen());
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








