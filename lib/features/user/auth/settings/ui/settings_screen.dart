


import 'package:flutter/material.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/constants/app_assets.dart';
import 'package:wazzifni/core/constants/app_textStyle.dart';
import 'package:wazzifni/core/constants/appcolors.dart';
import '../../../../../core/widgets/pages/custom_appbar_page.dart';
import '../../../../../core/widgets/sheets/logout_bottom_sheet.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isNightMode = false;

  @override
  Widget build(BuildContext context) {
    return AppBarPage(
      title: 'الإعدادات',
      body: SingleChildScrollView(
        child: Padding(
          padding: PaddingInsets.extraBigPaddingAll,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: PaddingInsets.normalPaddingAll,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: AppColors.boxShadow
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          AppAssets.dark,
                          width: 35,
                          height: 35,
                        ),
                        Gaps.hGap2,
                        Text(
                          'الوضع الليلي',
                          style: AppText.fontSizeNormalTextStyle,
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isNightMode = !isNightMode;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 24,
                        width: 48,
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: isNightMode ? Colors.black : Colors.grey.shade300,
                        ),
                        child: AnimatedAlign(
                          duration: const Duration(milliseconds: 300),
                          alignment: isNightMode
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            height: 16,
                            width: 16,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isNightMode ? Colors.white : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gaps.vGap2,
              InkWell(
                onTap: (){
                  showLogoutBottomSheet(context);
                },
                child: Container(
                  padding: PaddingInsets.normalPaddingAll,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: AppColors.boxShadow
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            AppAssets.logout,
                            width: 35,
                            height: 35,
                          ),
                          Gaps.hGap2,
                          Text(
                            'تسجيل الخروج',
                            style: AppText.fontSizeNormalTextStyle,
                          )
                        ],
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: AppColors.darkText,
                        size: 16,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




