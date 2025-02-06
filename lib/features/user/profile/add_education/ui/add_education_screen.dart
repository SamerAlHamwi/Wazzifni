

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/constants/appcolors.dart';
import 'package:wazzifni/core/utils/Navigation/Navigation.dart';
import 'package:wazzifni/core/utils/utils.dart';
import '../../../../../core/common/models/enums.dart';
import '../../../../../core/constants/Validators.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../../core/widgets/custom_widgets/custom_checkbox.dart';
import '../../../../../core/widgets/custom_widgets/custom_textfield.dart';
import '../../../../../core/widgets/pages/profile_page.dart';
import '../../../auth/complete_account/data/model/education_model.dart';
import '../../add_education_level/ui/add_education_level_screen.dart';


class AddEducationScreen extends StatefulWidget {
  const AddEducationScreen({super.key, this.educationModel});

  final EducationModel? educationModel;

  @override
  State<AddEducationScreen> createState() => _AddEducationScreenState();
}

class _AddEducationScreenState extends State<AddEducationScreen> {

  TextEditingController levelController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController targetController = TextEditingController();
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();
  TextEditingController descController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late EducationModel educationModel;
  bool isCurrentlyStudying = false;
  int? educationLevel = -1;

  @override
  void initState() {
    super.initState();
    initData();
  }

  initData(){
    if(widget.educationModel != null){
      educationLevel = widget.educationModel!.level;
      nameController.text = widget.educationModel!.institutionName ?? '';
      targetController.text = widget.educationModel!.fieldOfStudy ?? '';
      startController.text = widget.educationModel!.startDate?.year.toString() ?? '';
      endController.text = widget.educationModel!.endDate?.year.toString() ?? '';
      isCurrentlyStudying = widget.educationModel!.isCurrentlyStudying ?? false;
      descController.text = widget.educationModel!.description ?? '';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ProfileBackgroundPage(
      body: SingleChildScrollView(
        child: Padding(
          padding: PaddingInsets.extraBigPaddingAll,
          child: Form(
            key: _formKey,
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
                Gaps.vGap4,
                Text(
                  tr("add_education_level"),
                  style: AppText.fontSizeMediumTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.vGap2,
                GestureDetector(
                  onTap: () async {
                    educationLevel = await Navigation.push(AddEducationLevelScreen(educationLevel: educationLevel,));
                    if(educationLevel != null){
                      levelController.text = tr("education_level_${EducationLevel.values[educationLevel!].name}");
                    }
                  },
                  child: CustomTextField(
                    controller: levelController,
                    isEnabled: false,
                    labelText: tr("education_level"),
                  ),
                ),
                Gaps.vGap2,
                CustomTextField(
                  controller: nameController,
                  labelText: tr("institution_name"),
                  validator: Validators.validateEmptyValue,
                ),
                Gaps.vGap2,
                CustomTextField(
                  controller: targetController,
                  labelText: tr("field_of_study"),
                  validator: Validators.validateEmptyValue,
                ),
                Gaps.vGap2,
                SizedBox(
                  width: 100.w,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: startController,
                          keyboardType: TextInputType.number,
                          labelText: tr("start_date"),
                          validator: Validators.validateEmptyValue,
                        ),
                      ),
                      Gaps.hGap2,
                      Expanded(
                        child: CustomTextField(
                          controller: endController,
                          keyboardType: TextInputType.number,
                          labelText: tr("end_date"),
                          validator: Validators.validateEmptyValue,
                        ),
                      ),
                    ],
                  ),
                ),
                Gaps.vGap2,
                Row(
                  children: [
                    CustomCheckBox(
                      value: isCurrentlyStudying,
                      onChanged: (bool value) {
                        isCurrentlyStudying = value;
                      },
                    ),
                    Gaps.hGap2,
                    Text(
                      tr("still_studying"),
                      style: AppText.fontSizeNormalTextStyle.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                Gaps.vGap2,
                CustomTextField(
                  controller: descController,
                  maxLines: 5,
                  labelText: tr("description"),
                  hintText: tr("enter_additional_info"),
                ),
                Gaps.vGap2,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      text: tr("save"),
                      onTap: (){
                        _formKey.currentState!.save();
                        print("Form validation result: ${_formKey.currentState!.validate()}");

                        if(_formKey.currentState!.validate() && educationLevel != -1){
                          _formKey.currentState!.save();
                          educationModel = EducationModel(
                            level: educationLevel,
                            institutionName: nameController.text.trim(),
                            fieldOfStudy: targetController.text.trim(),
                            startDate: DateTime(int.parse(startController.text)),
                            endDate: DateTime(int.parse(endController.text)),
                            isCurrentlyStudying: isCurrentlyStudying,
                            description: descController.text.trim(),
                          );
                          Navigation.pop(value: educationModel);
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
      ),
    );
  }
}

