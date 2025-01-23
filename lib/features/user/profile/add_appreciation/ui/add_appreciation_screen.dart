

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/constants/appcolors.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../../core/widgets/custom_widgets/custom_textfield.dart';
import '../../../../../core/widgets/pages/profile_page.dart';


class AddAppreciationScreen extends StatelessWidget {
  AddAppreciationScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
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
                'إضافة تقديرات',
                style: AppText.fontSizeMediumTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.vGap2,
              CustomTextField(
                controller: nameController,
                labelText: 'اسم الجائزة',
              ),
              Gaps.vGap2,
              CustomTextField(
                controller: categoryController,
                labelText: 'الفئة/الانجاز الذي تم تحقيقه',
              ),
              Gaps.vGap2,
              SizedBox(
                width: 40.w,
                child: CustomTextField(
                  controller: dateController,
                  labelText: 'تاريخ الجائزة',
                  keyboardType: TextInputType.datetime,
                ),
              ),
              Gaps.vGap2,
              CustomTextField(
                controller: descController,
                maxLines: 5,
                labelText: 'الوصف',
                hintText: 'اكتب المعلومات الإضافية هنا',
              ),
              Gaps.vGap4,
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


