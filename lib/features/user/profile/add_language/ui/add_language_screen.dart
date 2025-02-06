

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/constants/appcolors.dart';
import 'package:wazzifni/core/utils/Navigation/Navigation.dart';
import 'package:wazzifni/features/user/auth/login/data/use_case/languages_use_case.dart';
import 'package:wazzifni/features/user/profile/add_language/ui/select_language_level.dart';
import 'package:wazzifni/features/user/profile/add_language/ui/widgets/select_language_card.dart';
import '../../../../../core/boilerplate/get_model/widgets/get_model.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../../core/widgets/custom_widgets/custom_textfield.dart';
import '../../../../../core/widgets/pages/profile_page.dart';
import '../../../auth/login/data/model/language_model.dart';
import '../../../auth/login/data/repository/auth_repository.dart';

class AddLanguageScreen extends StatefulWidget {
  const AddLanguageScreen({super.key, this.languages});

  final List<LanguageModel>? languages;

  @override
  State<AddLanguageScreen> createState() => _AddLanguageScreenState();
}

class _AddLanguageScreenState extends State<AddLanguageScreen> {
  final TextEditingController controller = TextEditingController();

  List<LanguageModel> languages = [];
  List<LanguageModel> filteredLanguages = [];

  @override
  void initState() {
    super.initState();
    initData();
    controller.addListener(_filterLanguages);
  }

  @override
  void dispose() {
    controller.removeListener(_filterLanguages);
    controller.dispose();
    super.dispose();
  }

  void initData() {
    if (widget.languages != null) {
      languages.addAll(widget.languages!);
      filteredLanguages = List.from(languages);
      setState(() {});
    }
  }

  void _filterLanguages() {
    String query = controller.text.toLowerCase();
    setState(() {
      filteredLanguages = languages
          .where((lang) => lang.name!.toLowerCase().contains(query))
          .toList();
    });
  }

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
                tr("add_language"),
                style: AppText.fontSizeMediumTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.vGap2,
              CustomTextField(
                controller: controller,
                hintText: tr("search_languages"),
              ),
              Gaps.vGap4,
              Column(
                children: filteredLanguages.map((e) => SelectLanguageCard(
                  title: e.name ?? '',
                  iconPath: e.icon?.url ?? '',
                  isSelected: isLanguageSelected(e),
                  onTap: () async {
                    LanguageModel? languageModel = await Navigation.push(
                      SelectLanguageLevelScreen(languageModel: getLanguageModel(e)),
                    );
                    if (languageModel != null) {
                      if (languages.isEmpty) {
                        languages.add(languageModel);
                      } else {
                        for (int i = 0; i < languages.length; i++) {
                          if (languages[i].id == languageModel.id) {
                            languages[i] = languageModel;
                            break;
                          }
                        }
                      }
                      _filterLanguages(); // Refresh search results
                      setState(() {});
                    }
                  },
                  onDelete: () {
                    languages.removeWhere((lang) => lang.id == e.id);
                    _filterLanguages(); // Refresh search results
                    setState(() {});
                  },
                )).toList(),
              ),
              Gaps.vGap2,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: tr("save"),
                    onTap: () {
                      Navigation.pop(value: languages);
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

  getLanguageModel(LanguageModel languageModel) {
    return languages.firstWhere((lang) => lang.id == languageModel.id,
        orElse: () => languageModel);
  }

  bool isLanguageSelected(LanguageModel languageModel) {
    return languages.any((lang) => lang.id == languageModel.id);
  }
}
