


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/widgets/custom_widgets/custom_textfield.dart';
import '../../../../core/utils/Navigation/Navigation.dart';
import '../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../core/widgets/custom_widgets/custom_range_slider_widget.dart';
import '../../../../core/widgets/custom_widgets/custom_wrap_expansion_tile.dart';
import '../../../../core/widgets/pages/custom_appbar_page.dart';
import 'extra_add_job_screen.dart';



class AddJobScreen extends StatelessWidget {
  const AddJobScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return AppBarPage(
      title: 'add_job_request'.tr(),
      body: SingleChildScrollView(
        child: Padding(
          padding: PaddingInsets.extraBigPaddingAll,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextField(
                  controller: TextEditingController(),
                  labelText: 'job_name'.tr(),
                  isRequired: true,
              ),
              Gaps.vGap2,
              CustomTextField(
                controller: TextEditingController(),
                labelText: 'job_description'.tr(),
                maxLines: 3,
                isRequired: true,
              ),
              Gaps.vGap1,
              CustomWrapExpansionTile(
                title: "job_type".tr(),
                items: [
                  "full_time".tr(),
                  "part_time".tr(),
                  "only_project".tr(),
                  "contract".tr(),
                ],
                isRequired: true,
                isExpanded: true,
              ),
              Gaps.vGap1,
              CustomWrapExpansionTile(
                title: "job_location".tr(),
                items: [
                  "team_leader".tr(),
                  "professional".tr(),
                  "beginner".tr(),
                  "manager".tr(),
                  "trainee".tr(),
                ],
                isRequired: true,
                isExpanded: true,
              ),
              Gaps.vGap1,
              CustomRangeSliderWidget(
                title: 'expected_salary'.tr(),
                max: 25,
                min: 13,
                isRequired: true,
              ),
              Gaps.vGap2,
              CustomButton(
                text: 'continue'.tr(),
                onTap: (){
                  Navigation.push(const ExtraAddJobScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}




