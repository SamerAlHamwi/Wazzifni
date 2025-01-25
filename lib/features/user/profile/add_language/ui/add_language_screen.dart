

import 'package:flutter/material.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/constants/app_assets.dart';
import 'package:wazzifni/core/constants/appcolors.dart';
import 'package:wazzifni/core/utils/Navigation/Navigation.dart';
import 'package:wazzifni/features/user/profile/add_language/ui/select_language_level.dart';
import 'package:wazzifni/features/user/profile/add_language/ui/widgets/select_language_card.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../../core/widgets/custom_widgets/custom_textfield.dart';
import '../../../../../core/widgets/pages/profile_page.dart';


class AddLanguageScreen extends StatelessWidget {
  AddLanguageScreen({super.key});


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
              CustomTextField(
                  controller: controller,
                  hintText: 'بحث عن لغات',
              ),
              Gaps.vGap4,
              SelectLanguageCard(
                title: 'العربية',
                iconPath: AppAssets.arabicIcon,
                onTap: (){
                  Navigation.push(SelectLanguageLevelScreen());
                },
              ),
              Gaps.vGap2,
              SelectLanguageCard(
                title: 'الإنكليزية',
                iconPath: AppAssets.englishIcon,
                onTap: (){
                  Navigation.push(SelectLanguageLevelScreen());
                },
              ),
              Gaps.vGap2,
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
