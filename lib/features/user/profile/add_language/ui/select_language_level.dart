

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/constants/appcolors.dart';
import 'package:wazzifni/core/utils/Navigation/Navigation.dart';
import 'package:wazzifni/core/widgets/image_widgets/custom_image.dart';
import 'package:wazzifni/features/user/auth/login/data/model/language_model.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../../core/widgets/custom_widgets/custom_checkbox.dart';
import '../../../../../core/widgets/custom_widgets/custom_slider_widget.dart';
import '../../../../../core/widgets/pages/profile_page.dart';


class SelectLanguageLevelScreen extends StatefulWidget {

  SelectLanguageLevelScreen({super.key,required this.languageModel});

  LanguageModel? languageModel;

  @override
  State<SelectLanguageLevelScreen> createState() => _SelectLanguageLevelScreenState();
}

class _SelectLanguageLevelScreenState extends State<SelectLanguageLevelScreen> {

  final TextEditingController controller = TextEditingController();


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
                'add_language'.tr(),
                style: AppText.fontSizeMediumTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.vGap2,
              Container(
                width: 100.w,
                padding: PaddingInsets.bigPaddingAll,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: AppColors.boxShadow,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'language'.tr(),
                          style: AppText.fontSizeNormalTextStyle.copyWith(
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        Row(
                          children: [
                            CustomImage.circular(
                              radius: 35,
                              isNetworkImage: true,
                              image: widget.languageModel!.icon?.url!,
                            ),
                            Gaps.hGap2,
                            Text(
                              widget.languageModel!.displayName ?? '',
                              style: AppText.fontSizeNormalTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Gaps.vGap2,
                    Container(
                      height: 1,
                      width: 75.w,
                      color: AppColors.grey.withOpacity(0.5),
                    ),
                    Gaps.vGap2,
                    RowCheckBox(
                        title: 'main_language'.tr(),
                        value: widget.languageModel!.isNative ?? false,
                        onChanged: (value){
                          widget.languageModel!.isNative = value;
                        },
                    ),
                  ],
                ),
              ),
              Gaps.vGap4,
              Container(
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  boxShadow: AppColors.boxShadow,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: 100.w,
                  padding: PaddingInsets.bigPaddingAll,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'speak'.tr(),
                        style: AppText.fontSizeMediumTextStyle.copyWith(
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      CustomSliderWidget(
                        title: 'level'.tr(),
                        max: 10,
                        min: 1,
                        currentValue: widget.languageModel!.oralLevel?.toDouble(),
                        onChanged: (value){
                          widget.languageModel!.oralLevel = value;
                        },
                      ),
                      Gaps.vGap1,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 1,
                            width: 75.w,
                            color: AppColors.grey.withOpacity(0.5),
                          ),
                        ],
                      ),
                      Gaps.vGap2,
                      Text(
                        'writing'.tr(),
                        style: AppText.fontSizeNormalTextStyle.copyWith(
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      CustomSliderWidget(
                        title: 'level'.tr(),
                        max: 10,
                        min: 1,
                        currentValue: widget.languageModel!.writingLevel?.toDouble(),
                        onChanged: (value){
                          widget.languageModel!.writingLevel = value;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Gaps.vGap4,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: 'save'.tr(),
                    onTap: () {
                      Navigation.pop(value: widget.languageModel);
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
