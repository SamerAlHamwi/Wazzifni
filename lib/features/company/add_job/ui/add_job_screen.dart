


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
      title: 'إضافة طلب توظيف',
      body: SingleChildScrollView(
        child: Padding(
          padding: PaddingInsets.extraBigPaddingAll,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextField(
                  controller: TextEditingController(),
                  labelText: 'اسم الوظيفة',
                  isRequired: true,
              ),
              Gaps.vGap2,
              CustomTextField(
                controller: TextEditingController(),
                labelText: 'وصف العمل',
                maxLines: 3,
                isRequired: true,
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
                isRequired: true,
                isExpanded: true,
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
                isRequired: true,
                isExpanded: true,
              ),
              Gaps.vGap1,
              const CustomRangeSliderWidget(
                title: 'الراتب المتوقع',
                max: 25,
                min: 13,
                isRequired: true,
              ),
              Gaps.vGap2,
              CustomButton(
                text: 'متابعة',
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




