

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/constants/appcolors.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../../core/widgets/custom_widgets/custom_checkbox.dart';
import '../../../../../core/widgets/custom_widgets/custom_textfield.dart';
import '../../../../../core/widgets/pages/profile_page.dart';


class AddEducationScreen extends StatelessWidget {
  AddEducationScreen({super.key});

  TextEditingController levelController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController targetController = TextEditingController();
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();
  TextEditingController descController = TextEditingController();

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
                    icon: const Icon(Icons.arrow_back_outlined, color: AppColors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              Gaps.vGap4,
              Text(
                'أضف مستوى تعليم',
                style: AppText.fontSizeMediumTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.vGap2,
              CustomTextField(
                controller: levelController,
                labelText: 'مستوى التعليم',
              ),
              Gaps.vGap2,
              CustomTextField(
                controller: nameController,
                labelText: 'اسم المؤسسة',
              ),
              Gaps.vGap2,
              CustomTextField(
                controller: targetController,
                labelText: 'مجال الدراسة',
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
                          labelText: 'تاريخ البدء'
                      ),
                    ),
                    Gaps.hGap2,
                    Expanded(
                      child: CustomTextField(
                          controller: endController,
                          keyboardType: TextInputType.number,
                          labelText: 'تاريخ الانتهاء'
                      ),
                    ),
                  ],
                ),
              ),
              Gaps.vGap2,
              Row(
                children: [
                  CustomCheckBox(
                    onChanged: (bool value) {},
                  ),
                  Gaps.hGap2,
                  Text(
                    'ما زلت ادرس',
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
                labelText: 'الوصف',
                hintText: 'اكتب المعلومات الإضافية هنا',
              ),
              Gaps.vGap2,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: 'حفظ',
                    onTap: (){

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
