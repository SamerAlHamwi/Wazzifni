

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wazzifni/features/company/user_apply/ui/widgets/user_apply_appbar.dart';
import '../../../../core/common/style/gaps.dart';
import '../../../../core/common/style/padding_insets.dart';
import '../../../../core/constants/app_textStyle.dart';
import '../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../core/widgets/custom_widgets/custom_textfield.dart';
import '../../../../core/widgets/pages/background_page.dart';
import 'widgets/user_apply_info.dart';


class CompanyUserApplyScreen extends StatelessWidget {
  const CompanyUserApplyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
      body: Column(
        children: [
          const UserApplyAppBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: PaddingInsets.bigPaddingAll,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      controller: TextEditingController(text: 'أنا الشخص المناسب لهذه الوظيفة'),
                      maxLines: 3,
                      labelText: 'apply_info'.tr(),
                      isEnabled: false,
                    ),
                    Gaps.vGap2,
                    const Divider(),
                    Gaps.vGap2,
                    const UserApplyInfo(),
                    Gaps.vGap2,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          text: 'call_employee'.tr(),
                          onTap: (){

                          },
                        ),
                      ],
                    ),
                    Gaps.vGap2,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




