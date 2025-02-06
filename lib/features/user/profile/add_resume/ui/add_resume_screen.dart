

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/constants/app_assets.dart';
import 'package:wazzifni/core/constants/appcolors.dart';
import 'package:wazzifni/core/utils/Navigation/Navigation.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../../core/widgets/pages/profile_page.dart';
import '../../../../company/apply_job/ui/widgets/cv_widget.dart';



class AddResumeScreen extends StatelessWidget {
  AddResumeScreen({super.key,required this.onChanged});

  Function(String?)? onChanged;

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
                tr("add_resume"),
                style: AppText.fontSizeMediumTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.vGap2,
              CvWidget(
                onChanged: (value){
                  onChanged!(value);
                },
              ),
              Gaps.vGap2,
              Text(
                tr("upload_resume_instruction"),
                style: AppText.fontSizeSmallTextStyle.copyWith(
                    color: AppColors.grey
                ),
              ),
              Gaps.vGap4,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: tr("save"),
                    onTap: () {
                      Navigation.pop();
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


