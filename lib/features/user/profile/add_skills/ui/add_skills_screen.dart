import 'package:flutter/material.dart';
import 'package:wazzifni/features/user/profile/add_skills/ui/widgets/skills_widget.dart';

import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/common/style/padding_insets.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/constants/appcolors.dart';
import '../../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../../core/widgets/pages/profile_page.dart';

class AddSkillScreen extends StatefulWidget {
  const AddSkillScreen({super.key});

  @override
  State<AddSkillScreen> createState() => _AddSkillScreenState();
}

class _AddSkillScreenState extends State<AddSkillScreen> {


  @override
  Widget build(BuildContext context) {
    return ProfileBackgroundPage(
      body: Padding(
        padding: PaddingInsets.extraBigPaddingAll,
        child: Column(
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
              'إضافة مهاراتك',
              style: AppText.fontSizeMediumTextStyle.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Gaps.vGap2,
            // Search Bar

            Gaps.vGap2,
            // Skill Tags
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: SkillsWidget(),
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
    );
  }
}

