




import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/constants/app_assets.dart';
import 'package:wazzifni/core/utils/Navigation/Navigation.dart';
import 'package:wazzifni/features/company/apply_job/ui/widgets/cv_widget.dart';
import 'package:wazzifni/features/company/company_job/ui/widgets/job_header_widget.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/constants/appcolors.dart';
import '../../../../../core/widgets/pages/background_page.dart';
import '../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../core/widgets/custom_widgets/custom_textfield.dart';
import 'apply_success_screen.dart';


class ApplyCv2Screen extends StatelessWidget {
  const ApplyCv2Screen({super.key});

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
                'رفع السيرة الذاتية',
                style: AppText.fontSizeMediumTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.vGap1,
              Text(
                'أضف السيرة الذاتية للتقدم إلى الوظيفة',
                style: AppText.fontSizeNormalTextStyle,
              ),
              Gaps.vGap2,
              const CvWidget(),
              Gaps.vGap4,
              Text(
                'معلومات إضافية',
                style: AppText.fontSizeMediumTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.vGap1,
              CustomTextField(
                controller: TextEditingController(),
                maxLines: 5,
                hintText: 'اشرج لماذا أنت الشخص المناسب لهذه الوظيفة',
              ),
              Gaps.vGap4,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: 'تقدم الآن',
                    onTap: (){
                      Navigation.push(const ApplySuccessScreen());
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










