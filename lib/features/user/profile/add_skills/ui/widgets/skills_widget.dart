

import 'package:flutter/material.dart';
import 'package:wazzifni/core/boilerplate/get_model/widgets/get_model.dart';

import '../../../../../../core/constants/app_textStyle.dart';
import '../../../../../../core/constants/appcolors.dart';
import '../../../../../../core/widgets/shimmer/wrap_list_shimmer.dart';
import '../../../../auth/complete_account/data/model/skills_model.dart';
import '../../../../auth/login/data/repository/auth_repository.dart';
import '../../../../auth/login/data/use_case/skills_use_case.dart';


class SkillsWidget extends StatefulWidget {
  const SkillsWidget({
    super.key,
    this.isWithEdit = true,
    required this.onChanged,
    this.selectedSkills
  });

  final bool isWithEdit;
  final Function(List<int>) onChanged;
  final List<int>? selectedSkills;

  @override
  State<SkillsWidget> createState() => _SkillsWidgetState();
}

class _SkillsWidgetState extends State<SkillsWidget> {

  final List<int> selectedSkills = [];

  @override
  void initState() {
    super.initState();
    initData();
  }

  initData(){
    if(widget.selectedSkills != null){
      selectedSkills.addAll(widget.selectedSkills ?? []);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetModel(
        useCaseCallBack: () {
          return GetSkillsUseCase(AuthRepository()).call(
            params: SkillsParams(),
          );
        },
        onSuccess: (model) {},
        loading: const WrapListShimmer(),
        modelBuilder: (SkillsListModel? skillsModel) {
          return Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: skillsModel!.items!
                .map(
                  (skill) => InkWell(
                onTap: () {
                  if(widget.isWithEdit){
                    if (selectedSkills.contains(skill.id)) {
                      selectedSkills.remove(skill.id);
                    } else {
                      selectedSkills.add(skill.id!);
                    }
                    widget.onChanged(selectedSkills);
                    setState(() {});
                  }
                },
                child: Chip(
                  label: Text(
                    skill.name ?? '',
                    style: AppText.fontSizeNormalTextStyle.copyWith(
                      color: selectedSkills.contains(skill.id)
                          ? AppColors.white
                          : AppColors.black,
                    ),
                  ),
                  backgroundColor: selectedSkills.contains(skill.id)
                      ? AppColors.primaryColor
                      : Colors.grey[200],
                  deleteIcon: selectedSkills.contains(skill.id)
                      ? Icon(
                    Icons.close,
                    color: selectedSkills.contains(skill.id)
                        ? AppColors.white
                        : AppColors.black,
                    size: 16,
                  )
                      : const SizedBox(),
                  onDeleted: () {
                    selectedSkills.remove(skill.id);
                    widget.onChanged(selectedSkills);
                    setState(() {});
                  },
                ),
              ),
            ).toList(),
          );
        },
    );
  }
}
