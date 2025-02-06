

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/features/company/company_home/ui/company_root_screen.dart';
import '../../../../core/utils/Navigation/Navigation.dart';
import '../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../core/widgets/custom_widgets/custom_slider_widget.dart';
import '../../../../core/widgets/custom_widgets/custom_wrap_expansion_tile.dart';
import '../../../../core/widgets/pages/custom_appbar_page.dart';



class ExtraAddJobScreen extends StatelessWidget {
  const ExtraAddJobScreen({super.key});


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
              CustomWrapExpansionTile(
                title: "academic_degree".tr(),
                items: [
                  'phd'.tr(),
                  'bachelor'.tr(),
                  'high_school'.tr(),
                  'middle_school'.tr(),
                ],
                isExpanded: true,
              ),
              Gaps.vGap1,
              CustomSliderWidget(
                title: 'years_of_experience'.tr(),
                max: 10,
                min: 1,
                onChanged: (value){

                },
              ),
              Gaps.vGap8,
              CustomButton(
                text: 'publish'.tr(),
                onTap: (){
                  Navigation.pushReplacement(const CompanyRootScreen());
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}




