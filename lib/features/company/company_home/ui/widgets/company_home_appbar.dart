

import 'package:flutter/material.dart';
import 'package:wazzifni/core/constants/app_assets.dart';
import 'package:wazzifni/features/user/notifications/ui/notifications_screen.dart';
import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/common/style/padding_insets.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/constants/appcolors.dart';
import '../../../../../core/utils/Navigation/Navigation.dart';
import '../../../../../core/widgets/custom_widgets/custom_progress_bar.dart';

class CompanyHomeAppBar extends StatelessWidget {
  const CompanyHomeAppBar({
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
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.primaryColor,
                  backgroundImage: AssetImage(
                    AppAssets.companyLogo,
                  ),
                ),
                Text(
                  'شركة البراء',
                  style: AppText.fontSizeMediumTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.white
                  ),
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
            Container(
              padding: PaddingInsets.normalPaddingAll,
              margin: PaddingInsets.bigPaddingHorizontal,
              decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(12),
                boxShadow: AppColors.boxShadow2,
              ),
              child: Column(
                children: [
                  const CustomProgressBar(
                    title: 'الوظائف قيد التقدم',
                    progress: 3,
                  ),
                  Gaps.vGap2,
                  const CustomProgressBar(
                    title: 'الوظائف المقدم إليها',
                    progress: 6,
                  ),
                  Gaps.vGap2,
                  const CustomProgressBar(
                    title: 'الوظائف المغلقة',
                    progress: 1,
                  ),
                ],
              ),
            ),
            Gaps.vGap1,
          ],
        ),
      ),
    );
  }
}




