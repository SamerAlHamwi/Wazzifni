import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wazzifni/core/utils/Navigation/Navigation.dart';
import 'package:wazzifni/core/widgets/custom_widgets/custom_textfield.dart';
import 'package:wazzifni/features/user/filter/ui/filter_screen.dart';
import '../../../../core/common/style/gaps.dart';
import '../../../../core/common/style/padding_insets.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_textStyle.dart';
import '../../../../core/constants/appcolors.dart';
import '../../jobs/ui/widgets/job_card_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<String> skills = [
    'قائد فريق',
    'عمل جماعي',
    'رؤية',
    'مهارات التواصل الجيدة',
    'انكليزية',
    'مسؤولية'
  ];

  String selectedSkill = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    children: [
                      Gaps.vGap2,
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'البحث',
                              textAlign: TextAlign.center,
                              style: AppText.fontSizeMediumTextStyle.copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gaps.vGap2,
                      Padding(
                        padding: PaddingInsets.bigPaddingHorizontal,
                        child: CustomTextField(
                          controller: TextEditingController(),
                          hintText: 'البحث',
                          isWithBorder: false,
                        ),
                      ),
                      Gaps.vGap2,
                    ],
                  ),
                ),
                Gaps.vGap2,
                SizedBox(
                  height: 40,
                  width: 100.w,
                  child: Padding(
                    padding: PaddingInsets.normalPaddingHorizontal,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigation.push(const FilterScreen());
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                gradient: AppColors.secondaryGradient,
                                borderRadius: BorderRadius.circular(8)),
                            child: Image.asset(
                              AppAssets.filter,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        Gaps.hGap1,
                        ...skills.map(
                          (skill) => InkWell(
                            onTap: () {
                              if(selectedSkill != skill){
                                selectedSkill = skill;
                              }else{
                                selectedSkill = '';
                              }
                              setState(() {});
                            },
                            child: Container(
                              height: 40,
                              padding: PaddingInsets.bigPaddingHorizontal,
                              margin: PaddingInsets.lowPaddingHorizontal,
                              decoration: BoxDecoration(
                                  color: selectedSkill.contains(skill)
                                      ? AppColors.primaryColor
                                      : Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: Text(
                                  skill,
                                  style: AppText.fontSizeNormalTextStyle.copyWith(
                                    color: selectedSkill.contains(skill)
                                        ? AppColors.white
                                        : AppColors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: PaddingInsets.normalPaddingAll,
                  child: Column(
                    children: [
                      JobCardWidget(
                        width: 100.w,
                      ),
                      Gaps.vGap05,
                      JobCardWidget(
                        width: 100.w,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
