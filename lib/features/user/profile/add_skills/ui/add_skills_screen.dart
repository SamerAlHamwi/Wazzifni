import 'package:flutter/material.dart';

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
  final List<String> skills = [
    'قائد فريق',
    'عمل جماعي',
    'رؤية',
    'مهارات التواصل الجيدة',
    'انكليزية',
    'مسؤولية'
  ];

  final List<String> selectedSkills = [];

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: skills
                    .map(
                      (skill) => InkWell(
                        onTap: () {
                          if (selectedSkills.contains(skill)) {
                            selectedSkills.remove(skill);
                          } else {
                            selectedSkills.add(skill);
                          }
                          setState(() {});
                        },
                        child: Chip(
                          label: Text(
                            skill,
                            style: AppText.fontSizeNormalTextStyle.copyWith(
                              color: selectedSkills.contains(skill)
                                  ? AppColors.white
                                  : AppColors.black,
                            ),
                          ),
                          backgroundColor: selectedSkills.contains(skill)
                              ? AppColors.primaryColor
                              : Colors.grey[200],
                          deleteIcon: selectedSkills.contains(skill)
                              ? Icon(
                                  Icons.close,
                                  color: selectedSkills.contains(skill)
                                      ? AppColors.white
                                      : AppColors.black,
                                  size: 16,
                                )
                              : const SizedBox(),
                          onDeleted: () {
                            selectedSkills.remove(skill);
                            setState(() {});
                          },
                        ),
                      ),
                    )
                    .toList(),
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
    );
  }
}

