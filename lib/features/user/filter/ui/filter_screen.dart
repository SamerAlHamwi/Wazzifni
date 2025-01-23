


import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/constants/app_textStyle.dart';
import 'package:wazzifni/core/constants/appcolors.dart';
import 'package:wazzifni/core/utils/Navigation/Navigation.dart';
import 'package:wazzifni/core/widgets/custom_widgets/custom_wrap_expansion_tile.dart';
import 'package:wazzifni/features/user/privacy_policy/ui/widgets/privacy_policy_item.dart';
import '../../../../core/common/models/box_model.dart';
import '../../../../core/common/models/dropdown_model.dart';
import '../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../core/widgets/custom_widgets/custom_dropdown.dart';
import '../../../../core/widgets/custom_widgets/custom_expansion_tile.dart';
import '../../../../core/widgets/pages/custom_appbar_page.dart';
import '../../auth/complete_account/ui/complete_account_screen.dart';


class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  // SfRangeValues _salaryRange = const SfRangeValues(13.0, 25.0);

  @override
  Widget build(BuildContext context) {
    return AppBarPage(
      title: 'الفلترة',
      body: SingleChildScrollView(
        child: Padding(
          padding: PaddingInsets.extraBigPaddingAll,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomExpansionTile(
                title: "آخر تحديث",
                items: [
                  'كل الوقت',
                  'اليوم',
                  'هذا الأسبوع',
                  'هذا الشهر'
                ],
              ),
              Gaps.vGap1,
              const CustomExpansionTile(
                title: "مكان العمل",
                items: [
                  'دوام مكتبي',
                  'نصف عن بعد',
                  'عن بعد',
                ],
              ),
              Gaps.vGap1,
              const CustomWrapExpansionTile(
                title: "نوع العمل",
                items: [
                  "دوام كامل",
                  "دوام جزئي",
                  "مشروع فقط",
                  "عقد",
                  "شراكة استراتيجية"
                ],
              ),
              Gaps.vGap1,
              const CustomWrapExpansionTile(
                title: "الموقع الوظيفي",
                items: [
                  "قائد فريق",
                  "محترف",
                  "مبتدئ",
                  "مدير",
                  "متدرب"
                ],
              ),
              Gaps.vGap1,
              CustomDropdown(
                labelText: 'الفئة',
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
                labelText: 'الفئة الفرعية',
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
                labelText: 'الموقع',
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
              const CustomExpansionTile(
                title: "الخبرة",
                items: [
                  'بدون خبرة',
                  'أقل من سنة',
                  'سنة - ثلاث سنوات',
                  'ثلاث - خمس سنوات',
                  'اكثر من خمس سنوات',
                ],
              ),
              Gaps.vGap2,
              Theme(
                data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  title: const Text(
                    "الراتب المتوقع",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  trailing: const Icon(Icons.expand_less, color: Colors.black), // Custom expand icon
                  maintainState: true,
                  children: [
                    // Column(
                    //   children: [
                    //     SfRangeSlider(
                    //       min: 0.0,
                    //       max: 100.0,
                    //       values: _salaryRange,
                    //       interval: 20,
                    //       showTicks: false,
                    //       showLabels: false,
                    //       enableTooltip: false,
                    //       minorTicksPerInterval: 1,
                    //       onChanged: (SfRangeValues values){
                    //         setState(() {
                    //           _salaryRange = values;
                    //         });
                    //       },
                    //       activeColor: AppColors.primaryColor,
                    //       inactiveColor: AppColors.subWhite,
                    //     ),
                    //     // Salary Labels
                    //     Padding(
                    //       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Text("\$${_salaryRange.start.toInt()}k",
                    //               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    //           Text("\$${_salaryRange.end.toInt()}k",
                    //               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
              Gaps.vGap2,
              CustomButton(
                text: 'موافقة ومتابعة',
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


