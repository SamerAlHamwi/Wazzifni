


import 'package:flutter/material.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/constants/app_textStyle.dart';
import 'package:wazzifni/core/constants/appcolors.dart';
import 'package:wazzifni/core/utils/Navigation/Navigation.dart';
import 'package:wazzifni/core/widgets/custom_widgets/custom_wrap_expansion_tile.dart';
import '../../../../core/common/models/dropdown_model.dart';
import '../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../core/widgets/custom_widgets/custom_dropdown.dart';
import '../../../../core/widgets/custom_widgets/custom_expansion_tile.dart';
import '../../../../core/widgets/custom_widgets/custom_slider_widget.dart';
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
                isExpanded: true,
              ),
              Gaps.vGap1,
              const CustomExpansionTile(
                title: "مكان العمل",
                items: [
                  'دوام مكتبي',
                  'نصف عن بعد',
                  'عن بعد',
                ],
                isExpanded: true,
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
              const CustomSliderWidget(),
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


