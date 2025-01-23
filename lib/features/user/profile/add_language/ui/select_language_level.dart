



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/constants/app_assets.dart';
import 'package:wazzifni/core/constants/appcolors.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../../core/widgets/custom_widgets/custom_checkbox.dart';
import '../../../../../core/widgets/pages/profile_page.dart';


class SelectLanguageLevelScreen extends StatelessWidget {
  SelectLanguageLevelScreen({super.key});


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
                'إضافة لغة',
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
                          'اللغة',
                          style: AppText.fontSizeNormalTextStyle.copyWith(
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              AppAssets.englishIcon,
                              width: 35,
                              height: 35,
                            ),
                            Gaps.hGap2,
                            Text(
                              'الإنجليزية',
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
                        title: 'هل هذه اللغة الأساسية',
                        onChanged: (value){

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
                        'شفوياً',
                        style: AppText.fontSizeNormalTextStyle.copyWith(
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      Text(
                        'المستوى 10',
                        style: AppText.fontSizeNormalTextStyle,
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
                        'كتابياًً',
                        style: AppText.fontSizeNormalTextStyle.copyWith(
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      Text(
                        'المستوى 10',
                        style: AppText.fontSizeNormalTextStyle,
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
                    text: 'حفظ',
                    onTap: () {},
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
