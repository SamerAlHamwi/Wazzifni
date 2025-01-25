

import 'package:flutter/material.dart';

import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/common/style/padding_insets.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/constants/appcolors.dart';
import '../../../../../core/utils/Navigation/Navigation.dart';
import '../../../../user/notifications/ui/notifications_screen.dart';


class CompanyJobsAppBar extends StatelessWidget {
  const CompanyJobsAppBar({
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
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: PaddingInsets.bigPaddingHV,
            child: Column(
              children: [
                Gaps.vGap5,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigation.push(const NotificationsScreen());
                      },
                      icon: Image.asset(
                        AppAssets.notifications,
                        color: AppColors.white,
                      ),
                    ),
                    Text(
                      'شركة البراء',
                      style: AppText.fontSizeNormalTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                    PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == 'edit') {
                          // Implement edit action
                        } else if (value == 'logout') {
                          // Implement logout action
                        }
                      },
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem(
                            value: 'edit',
                            child: Text(
                              'تعديل الحساب',
                              style: AppText.fontSizeNormalTextStyle,
                            ),
                          ),
                          PopupMenuItem(
                            value: 'logout',
                            child: Text(
                              'تسجيل الخروج',
                              style: AppText.fontSizeNormalTextStyle,
                            ),
                          ),
                        ];
                      },
                      icon: const Icon(
                        Icons.more_vert,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          TabBar(
            indicatorColor: AppColors.blue,
            indicatorWeight: 2,
            indicatorPadding: PaddingInsets.bigPaddingHorizontal,
            labelStyle: AppText.fontSizeNormalTextStyle.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: AppText.fontSizeNormalTextStyle.copyWith(
              color: AppColors.white,
            ),
            tabs: const [
              Tab(text: 'طلبـات التوظيف'),
              Tab(text: 'الوظائف'),
            ],
          ),
        ],
      ),
    );
  }
}