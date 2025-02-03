

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wazzifni/core/constants/app_assets.dart';
import 'package:wazzifni/features/user/notifications/ui/notifications_screen.dart';
import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/common/style/padding_insets.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/constants/appcolors.dart';
import '../../../../../core/utils/Navigation/Navigation.dart';
import '../../../../../core/widgets/custom_widgets/custom_textfield.dart';
import '../../../filter/ui/filter_screen.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
          boxShadow: AppColors.boxShadow,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          )
      ),
      child: Padding(
        padding: PaddingInsets.bigPaddingHV,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.vGap5,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColors.primaryColor,
                    ),
                    Gaps.hGap2,
                    Text(
                      'مرحباً، سامر الحموي',
                      style: AppText.fontSizeNormalTextStyle.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.white
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: (){
                    Navigation.push(const NotificationsScreen());
                  },
                  icon: Image.asset(
                    AppAssets.notifications,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            Gaps.vGap2,
            Text(
              'home_hint'.tr(),
              style: AppText.fontSizeLargeTextStyle.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.white
              ),
            ),
            Gaps.vGap2,
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: TextEditingController(),
                    hintText: 'search'.tr(),
                  ),
                ),
                Gaps.hGap2,
                GestureDetector(
                  onTap: (){
                    Navigation.push(const FilterScreen());
                  },
                  child: Container(
                    height: 56,
                    width: 56,
                    decoration: BoxDecoration(
                        gradient: AppColors.secondaryGradient,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Image.asset(
                      AppAssets.filter,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
            Gaps.vGap2,
          ],
        ),
      ),
    );
  }
}