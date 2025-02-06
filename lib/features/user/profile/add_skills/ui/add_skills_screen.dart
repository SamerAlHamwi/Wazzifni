

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wazzifni/core/utils/Navigation/Navigation.dart';
import 'package:wazzifni/features/user/profile/add_skills/ui/widgets/skills_widget.dart';
import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/common/style/padding_insets.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/constants/appcolors.dart';
import '../../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../../core/widgets/pages/profile_page.dart';

class AddSkillScreen extends StatefulWidget {
  const AddSkillScreen({super.key,this.selectedSkills});

  final List<int>? selectedSkills;

  @override
  State<AddSkillScreen> createState() => _AddSkillScreenState();
}

class _AddSkillScreenState extends State<AddSkillScreen> {

  List<int> skills = [];

  @override
  void initState() {
    super.initState();
    initData();
  }

  initData(){
    if(widget.selectedSkills != null){
      skills.addAll(widget.selectedSkills ?? []);
      setState(() {});
    }
  }

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
                      color: AppColors.black,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            Gaps.vGap4,
            Text(
              'add_skills'.tr(),
              style: AppText.fontSizeMediumTextStyle.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Gaps.vGap2,
            // Search Bar

            Gaps.vGap2,
            // Skill Tags
            Padding(
              padding: PaddingInsets.normalPaddingHorizontal,
              child: SkillsWidget(
                selectedSkills: skills,
                onChanged: (List<int> selectedSkills){
                  skills = selectedSkills;
                },
              ),
            ),
            Gaps.vGap4,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  text: 'save'.tr(),
                  onTap: () {
                    Navigation.pop(value: skills);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

