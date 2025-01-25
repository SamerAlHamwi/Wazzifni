

import 'package:flutter/material.dart';
import 'package:wazzifni/core/utils/Navigation/Navigation.dart';
import 'package:wazzifni/features/user/auth/settings/ui/settings_screen.dart';
import 'package:wazzifni/features/user/notifications/ui/notifications_screen.dart';
import 'package:wazzifni/features/user/profile/profile/ui/edit_profile_screen.dart';
import '../../../../../../core/common/style/gaps.dart';
import '../../../../../../core/common/style/padding_insets.dart';
import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/constants/app_textStyle.dart';
import '../../../../../../core/constants/appcolors.dart';



class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key, this.isWithEdit = true});

  final bool isWithEdit;

  @override
  Widget build(BuildContext context) {
    return Column(
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: PaddingInsets.normalPaddingAll,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    isWithEdit
                        ? GestureDetector(
                            onTap: () {
                              Navigation.push(const EditProfileScreen());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: AppColors.white.withOpacity(0.2),
                              ),
                              padding: PaddingInsets.normalPaddingAll,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      AppAssets.edit,
                                      width: 20,
                                      height: 20,
                                    ),
                                    Gaps.hGap1,
                                    Text(
                                      'تعديل الحساب',
                                      style: AppText.fontSizeSmallTextStyle
                                          .copyWith(color: AppColors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        : IconButton(
                            icon: const Icon(Icons.arrow_back_outlined,
                                color: AppColors.white),
                            onPressed: () => Navigator.pop(context),
                          ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigation.push(const NotificationsScreen());
                          },
                          child: Image.asset(
                            AppAssets.notifications,
                            width: 20,
                            height: 20,
                          ),
                        ),
                        Gaps.hGap2,
                        GestureDetector(
                          onTap: () {
                            Navigation.push(const SettingsScreen());
                          },
                          child: Image.asset(
                            AppAssets.settings,
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const CircleAvatar(
                radius: 36,
                backgroundColor: AppColors.primaryColor,
              ),
              Gaps.vGap2,
              Text(
                'سامر الحموي',
                textAlign: TextAlign.center,
                style: AppText.fontSizeMediumTextStyle.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.vGap2,
            ],
          ),
        ),
        Gaps.vGap2,
      ],
    );
  }
}
