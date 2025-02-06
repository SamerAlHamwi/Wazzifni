

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/constants/appcolors.dart';
import '../../../../../core/constants/Validators.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/utils/Navigation/Navigation.dart';
import '../../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../../core/widgets/custom_widgets/custom_checkbox.dart';
import '../../../../../core/widgets/custom_widgets/custom_textfield.dart';
import '../../../../../core/widgets/pages/profile_page.dart';
import '../../../auth/complete_account/data/model/work_experiences_model.dart';


class AddWorkScreen extends StatefulWidget {
  const AddWorkScreen({super.key, this.workModel});

  final WorkExperiencesModel? workModel;

  @override
  State<AddWorkScreen> createState() => _AddWorkScreenState();
}

class _AddWorkScreenState extends State<AddWorkScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();
  TextEditingController descController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isCurrentJob = false;
  late WorkExperiencesModel workExperiencesModel;

  @override
  void initState() {
    super.initState();
    initData();
  }

  initData(){
    if(widget.workModel != null){
      nameController.text = widget.workModel!.jobTitle ?? '';
      companyController.text = widget.workModel!.companyName ?? '';
      descController.text = widget.workModel!.description ?? '';
      startController.text = widget.workModel!.startDate?.year.toString() ?? '';
      endController.text = widget.workModel!.endDate?.year.toString() ?? '';
      isCurrentJob = widget.workModel!.isCurrentJob ?? false;
      setState(() {});
    }
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
                  tr("add_work_experience"),
                  style: AppText.fontSizeMediumTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.vGap2,
                CustomTextField(
                  controller: nameController,
                  labelText: tr("job_title"),
                  validator: Validators.validateEmptyValue,
                ),
                Gaps.vGap2,
                CustomTextField(
                  controller: companyController,
                  labelText: tr("company_name"),
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
                      value: isCurrentJob,
                      onChanged: (bool value) {
                        isCurrentJob = value;
                      },
                    ),
                    Gaps.hGap2,
                    Text(
                      tr("current_job"),
                      style: AppText.fontSizeNormalTextStyle.copyWith(
                          fontWeight: FontWeight.w300
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
                  validator: Validators.validateEmptyValue,
                ),
                Gaps.vGap2,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      text: "save".tr(),
                      onTap: (){
                        if(_formKey.currentState!.validate()){
                          workExperiencesModel = WorkExperiencesModel(
                            jobTitle: nameController.text.trim(),
                            companyName: companyController.text.trim(),
                            startDate: DateTime(int.parse(startController.text)),
                            endDate: DateTime(int.parse(endController.text)),
                            isCurrentJob: isCurrentJob,
                            description: descController.text.trim()
                          );
                          Navigation.pop(value: workExperiencesModel);
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
