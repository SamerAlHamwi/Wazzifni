

import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_textStyle.dart';
import '../../../../../../core/constants/appcolors.dart';


class SkillsWidget extends StatefulWidget {
  const SkillsWidget({
    super.key,
    this.isWithEdit = true,
  });

  final bool isWithEdit;

  @override
  State<SkillsWidget> createState() => _SkillsWidgetState();
}

class _SkillsWidgetState extends State<SkillsWidget> {
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
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: skills
          .map(
            (skill) => InkWell(
          onTap: () {
            if(widget.isWithEdit){
              if (selectedSkills.contains(skill)) {
                selectedSkills.remove(skill);
              } else {
                selectedSkills.add(skill);
              }
              setState(() {});
            }
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
    );
  }
}
