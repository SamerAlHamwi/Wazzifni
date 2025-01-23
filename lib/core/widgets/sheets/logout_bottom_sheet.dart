


import 'package:flutter/material.dart';

import '../../../features/user/auth/welcome/ui/welcome_screen.dart';
import '../../common/style/gaps.dart';
import '../../constants/app_textStyle.dart';
import '../../constants/appcolors.dart';
import '../../utils/Navigation/Navigation.dart';
import '../custom_widgets/custom_button.dart';

showLogoutBottomSheet(BuildContext context){
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 4,
              width: 40,
              decoration: BoxDecoration(
                color: AppColors.darkText,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Gaps.vGap4,
            Text(
              'تسجيل الخروج',
              style: AppText.fontSizeMediumTextStyle.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Gaps.vGap1,
            Text(
              'هل أنت متأكد أنك تريد المغادرة؟',
              style: AppText.fontSizeNormalTextStyle,
            ),
            Gaps.vGap4,
            CustomButton(
              text: 'نعم',
              onTap: (){
                Navigation.pushReplacement(const WelcomeScreen());
              },
            ),
            Gaps.vGap2,
            CustomButton(
              text: 'إلغاء',
              isSecondaryGradient: true,
              onTap: (){
                Navigation.pop();
              },
            ),
          ],
        ),
      );
    },
  );
}