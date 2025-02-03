


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/utils/Navigation/Navigation.dart';
import 'package:wazzifni/core/widgets/custom_widgets/custom_wrap_expansion_tile.dart';
import '../../../../core/common/models/dropdown_model.dart';
import '../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../core/widgets/custom_widgets/custom_dropdown.dart';
import '../../../../core/widgets/custom_widgets/custom_expansion_tile.dart';
import '../../../../core/widgets/custom_widgets/custom_range_slider_widget.dart';
import '../../../../core/widgets/pages/custom_appbar_page.dart';
import '../../auth/complete_account/ui/complete_account_screen.dart';


class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {


  @override
  Widget build(BuildContext context) {
    return AppBarPage(
      title: 'filter'.tr(),
      body: SingleChildScrollView(
        child: Padding(
          padding: PaddingInsets.extraBigPaddingAll,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomExpansionTile(
                title: "last_update".tr(),
                items: [
                  'all_time'.tr(),
                  'today'.tr(),
                  'this_week'.tr(),
                  'this_month'.tr()
                ],
                isExpanded: true,
              ),
              Gaps.vGap1,
              CustomExpansionTile(
                title: "work_location".tr(),
                items: [
                  'onsite'.tr(),
                  'hybrid'.tr(),
                  'remote'.tr(),
                ],
                isExpanded: true,
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
              ),
              Gaps.vGap1,
              CustomWrapExpansionTile(
                title: "job_location".tr(),
                items: [
                  "team_leader".tr(),
                  "professional".tr(),
                  "beginner".tr(),
                  "manager".tr(),
                  "trainee".tr()
                ],
              ),
              Gaps.vGap1,
              CustomDropdown(
                labelText: 'category'.tr(),
                items: [
                  DropDownItem(id: 1, name: 'برمجة'),
                  DropDownItem(id: 2, name: 'تصميم'),
                  DropDownItem(id: 3, name: 'عمارة'),
                ],
                onChanged: (String selectedId) {
                  print("Selected ID: $selectedId");
                },
              ),
              Gaps.vGap2,
              CustomDropdown(
                labelText: 'sub_category'.tr(),
                items: [
                  DropDownItem(id: 1, name: 'ويب'),
                  DropDownItem(id: 2, name: 'موبايل'),
                  DropDownItem(id: 3, name: 'باك ايند'),
                ],
                onChanged: (String selectedId) {
                  print("Selected ID: $selectedId");
                },
              ),
              Gaps.vGap2,
              CustomDropdown(
                labelText: 'location'.tr(),
                items: [
                  DropDownItem(id: 1, name: 'بغداد'),
                  DropDownItem(id: 2, name: 'الموصل'),
                  DropDownItem(id: 3, name: 'اربيل'),
                ],
                onChanged: (String selectedId) {
                  print("Selected ID: $selectedId");
                },
              ),
              Gaps.vGap1,
              CustomExpansionTile(
                title: "experience".tr(),
                items: [
                  'بدون خبرة',
                  'أقل من سنة',
                  'سنة - ثلاث سنوات',
                  'ثلاث - خمس سنوات',
                  'اكثر من خمس سنوات',
                ],
              ),
              Gaps.vGap2,
              CustomRangeSliderWidget(
                title: 'expected_salary'.tr(),
                max: 25,
                min: 13,
              ),
              Gaps.vGap2,
              CustomButton(
                text: 'continue'.tr(),
                onTap: (){
                  Navigation.push(const CompleteAccountScreen());
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}


