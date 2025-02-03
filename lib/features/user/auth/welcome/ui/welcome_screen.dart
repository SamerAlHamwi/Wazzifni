



import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/constants/app_assets.dart';
import 'package:wazzifni/core/utils/Navigation/Navigation.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/constants/appcolors.dart';
import '../../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../../core/widgets/pages/background_page.dart';
import '../../../../company/auth/login_company/ui/login_company_screen.dart';
import '../../login/ui/login_screen.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

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
            Gaps.vGap4,
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Wazzifni',
                  style: AppText.fontSizeMediumTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Gaps.vGap8,
            Image.asset(
                AppAssets.logo,
              width: 250,
              height: 250,
            ),
            Gaps.vGap8,
            Text(
              'welcome'.tr(),
              style: AppText.fontSizeExtraLargeTextStyle,
            ),
            Gaps.vGap2,
            CustomButton(
              text: 'employee'.tr(),
              onTap: (){
                Navigation.push(const LoginScreen());
              },
            ),
            Gaps.vGap1,
            CustomButton(
              text: 'company'.tr(),
              isSecondaryGradient: true,
              onTap: (){
                Navigation.push(LoginCompanyScreen());
              },
            ),
            Gaps.vGap1,
            CustomButton(
              text: 'foreign_labor'.tr(),
              isWithGradient: false,
              buttonColor: AppColors.subWhite,
              onTap: (){

              },
            ),
            Gaps.vGap2,
            Text(
              'welcome_hint'.tr(),
              textAlign: TextAlign.center,
              style: AppText.fontSizeNormalTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
