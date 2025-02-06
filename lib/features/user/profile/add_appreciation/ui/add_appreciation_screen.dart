

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/constants/appcolors.dart';
import 'package:wazzifni/core/utils/Navigation/Navigation.dart';
import '../../../../../core/constants/Validators.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../../core/widgets/custom_widgets/custom_textfield.dart';
import '../../../../../core/widgets/pages/profile_page.dart';
import '../../../auth/complete_account/data/model/award_model.dart';


class AddAppreciationScreen extends StatefulWidget {
  const AddAppreciationScreen({super.key,this.awardModel});

  final AwardModel? awardModel;

  @override
  State<AddAppreciationScreen> createState() => _AddAppreciationScreenState();
}

class _AddAppreciationScreenState extends State<AddAppreciationScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descController = TextEditingController();
  late AwardModel awardModel;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    initData();
  }

  initData(){
    if(widget.awardModel != null){
      nameController.text = widget.awardModel!.name ?? '';
      categoryController.text = widget.awardModel!.category ?? '';
      dateController.text = widget.awardModel!.date!.year.toString();
      descController.text = widget.awardModel!.description ?? '';
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
                  tr("add_appreciation"),
                  style: AppText.fontSizeMediumTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.vGap2,
                CustomTextField(
                  controller: nameController,
                  labelText: tr("award_name"),
                ),
                Gaps.vGap2,
                CustomTextField(
                  controller: categoryController,
                  labelText: tr("category_achievement"),
                  validator: Validators.validateEmptyValue,
                ),
                Gaps.vGap2,
                SizedBox(
                  width: 40.w,
                  child: CustomTextField(
                    controller: dateController,
                    labelText: tr("award_date"),
                    keyboardType: TextInputType.number,
                    validator: Validators.validateEmptyValue,
                  ),
                ),
                Gaps.vGap2,
                CustomTextField(
                  controller: descController,
                  maxLines: 5,
                  labelText: tr("description"),
                  hintText: tr("enter_additional_info"),
                  validator: Validators.validateEmptyValue,
                ),
                Gaps.vGap4,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      text: tr("save"),
                      onTap: (){
                        if(_formKey.currentState!.validate()){
                          awardModel = AwardModel(
                            name: nameController.text.trim(),
                            category: categoryController.text.trim(),
                            date: DateTime(int.parse(dateController.text.trim())),
                            description: descController.text.trim(),
                          );
                          Navigation.pop(value: awardModel);
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



