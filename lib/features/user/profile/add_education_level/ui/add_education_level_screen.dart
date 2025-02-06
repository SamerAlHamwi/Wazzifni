

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/constants/appcolors.dart';
import 'package:wazzifni/core/utils/Navigation/Navigation.dart';
import 'package:wazzifni/core/utils/utils.dart';
import '../../../../../core/common/models/enums.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../../core/widgets/custom_widgets/custom_checkbox.dart';
import '../../../../../core/widgets/pages/profile_page.dart';


class AddEducationLevelScreen extends StatefulWidget {
  const AddEducationLevelScreen({super.key, this.educationLevel});

  final int? educationLevel;

  @override
  State<AddEducationLevelScreen> createState() => _AddEducationLevelScreenState();
}

class _AddEducationLevelScreenState extends State<AddEducationLevelScreen> {

  int selectedEducation = -1;
  @override
  void initState() {
    super.initState();
    initData();
  }

  initData(){
    if(widget.educationLevel != null){
      selectedEducation = widget.educationLevel!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ProfileBackgroundPage(
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
                    icon: const Icon(Icons.arrow_back_outlined,
                        color: AppColors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              Gaps.vGap4,
              Text(
                'education_level2'.tr(),
                style: AppText.fontSizeMediumTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.vGap2,
              ...List.generate(
                  EducationLevel.values.length,
                  (index) => Padding(
                    padding: PaddingInsets.lowPaddingVertical,
                    child: RowCheckBox(
                          value: selectedEducation == index,
                          title: tr("education_level_${EducationLevel.values[index].name}"),
                          onChanged: (value) {
                            selectedEducation = index;
                          },
                        ),
                  )),
              Gaps.vGap2,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: 'save'.tr(),
                    onTap: () {
                      if(selectedEducation != 1){
                        Navigation.pop(value: EducationLevel.values[selectedEducation].index);
                      }else{
                        Utils.showToast('please_select_education_level'.tr());
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
