

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/common/style/padding_insets.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/constants/appcolors.dart';
import '../../../../../core/utils/Navigation/Navigation.dart';
import '../../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../../core/widgets/custom_widgets/custom_textfield.dart';
import '../../../../../core/widgets/pages/background_page.dart';
import '../../../../user/auth/verify_phone/ui/verify_phone_screen.dart';
import '../../signup_company/ui/signup_comapny_screen.dart';


class LoginCompanyScreen extends StatelessWidget {
  LoginCompanyScreen({super.key});

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
      body: Padding(
        padding: PaddingInsets.extraBigPaddingAll,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Wazzifni',
                  style: AppText.fontSizeNormalTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Gaps.vGap2,
            Image.asset(
              AppAssets.logo,
              width: 150,
              height: 150,
            ),
            Gaps.vGap2,
            Text(
              'مرحبا بعودتك',
              style: AppText.fontSizeExtraLargeTextStyle,
            ),
            Text(
              'اعثر على موظفك المميز بنقرة',
              style: AppText.fontSizeNormalTextStyle,
            ),
            Gaps.vGap12,
            SizedBox(
              width: 100.w,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 60,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: AppColors.primaryGradient,
                      boxShadow: AppColors.boxShadow,
                    ),
                    child: Center(
                      child: Text(
                        '+964',
                        style: AppText.fontSizeNormalTextStyle.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  Gaps.hGap2,
                  Expanded(
                    child: CustomTextField(
                        controller: controller,
                        labelText: 'رقم الهاتف'
                    ),
                  ),
                ],
              ),
            ),
            Gaps.vGap4,
            CustomButton(
              text: 'تسجيل الدخول',
              onTap: (){
                Navigation.push(const VerifyPhoneScreen());
              },
            ),
            Gaps.vGap2,

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ليس لديك حساب شركة حتى الآن؟  ',
                  style: AppText.fontSizeNormalTextStyle,
                ),
                InkWell(
                  onTap: (){
                    Navigation.push(SignUpCompanyScreen());
                  },
                  child: Text(
                    'انشاء حساب شركة',
                    style: AppText.fontSizeNormalTextStyle.copyWith(
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
