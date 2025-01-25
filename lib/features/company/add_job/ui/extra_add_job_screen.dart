

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
      title: 'إضافة طلب توظيف',
      body: SingleChildScrollView(
        child: Padding(
          padding: PaddingInsets.extraBigPaddingAll,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomWrapExpansionTile(
                title: "الدرجة العلمية",
                items: [
                  'بكالوريوس',
                  'دكتوراه',
                  'ثانوية',
                  'إعدادبة',
                ],
                isExpanded: true,
              ),
              Gaps.vGap1,
              const CustomSliderWidget(
                title: 'عدد سنوات الخبرة',
                max: 10,
                min: 1,
              ),
              Gaps.vGap8,
              CustomButton(
                text: 'نشر',
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




