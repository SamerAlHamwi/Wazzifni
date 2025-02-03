


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/common/style/padding_insets.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/constants/appcolors.dart';
import '../../../../../core/utils/Navigation/Navigation.dart';
import '../../../user_apply/ui/user_apply_screen.dart';


class UserApplyCard extends StatelessWidget {
  const UserApplyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigation.push(const CompanyUserApplyScreen());
      },
      child: Container(
        width: 100.w,
        padding: PaddingInsets.cardPaddingHV,
        margin: PaddingInsets.normalPaddingAll,
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: AppColors.boxShadow,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColors.primaryColor,
                      backgroundImage: AssetImage(
                        AppAssets.companyLogo,
                      ),
                    ),
                    Gaps.hGap2,
                    SizedBox(
                      width: 200,
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            'سامر الحموي',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppText
                                .fontSizeMediumTextStyle
                                .copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Gaps.vGap1,
                          Text(
                            'مصمم مواقع احترافي',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppText
                                .fontSizeNormalTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'edit') {
                      // Implement edit action
                    } else if (value == 'delete') {
                      // Implement logout action
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem(
                        value: 'edit',
                        child: Text(
                          'approve_employee',
                          style: AppText
                              .fontSizeNormalTextStyle,
                        ),
                      ),
                      PopupMenuItem(
                        value: 'delete',
                        child: Text(
                          'delete'.tr(),
                          style: AppText
                              .fontSizeNormalTextStyle,
                        ),
                      ),
                    ];
                  },
                  icon: const Icon(
                    Icons.more_vert,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
            Gaps.vGap2,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'منذ ساعتين',
                  style: AppText.fontSizeSmallTextStyle,
                ),
                Gaps.hGap1,
                Text(
                  '#1234',
                  style: AppText.fontSizeMediumTextStyle
                      .copyWith(
                    color: AppColors.gold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
