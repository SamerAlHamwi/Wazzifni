

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/utils/Navigation/Navigation.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/constants/appcolors.dart';
import '../../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../../core/widgets/pages/background_page.dart';
import '../../../privacy_policy/ui/privacy_policy_screen.dart';


class VerifyPhoneScreen extends StatefulWidget {
  const VerifyPhoneScreen({super.key,this.isCompany = false});

  final bool isCompany;

  @override
  State<VerifyPhoneScreen> createState() => _VerifyPhoneScreenState();
}

class _VerifyPhoneScreenState extends State<VerifyPhoneScreen> {


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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Wazzifni',
                  style: AppText.fontSizeNormalTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_back_outlined, color: AppColors.black),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            Gaps.vGap8,
            Text(
              'enter_verification_code'.tr(),
              style: AppText.fontSizeExtraLargeTextStyle,
            ),
            Text(
              'sent_code'.tr(),
              style: AppText.fontSizeNormalTextStyle,
            ),
            Text(
              '964123456789+',
              style: AppText.fontSizeNormalTextStyle,
            ),
            Gaps.vGap4,
            Pinput(
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              validator: (s) {
                return s == '2222' ? null : 'Pin is incorrect';
              },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onCompleted: (pin) => print(pin),
            ),
            Gaps.vGap4,
            CustomButton(
              text: 'continue'.tr(),
              onTap: (){
                Navigation.push(PrivacyPolicyScreen(isCompany: widget.isCompany,));
              },
            ),
            Gaps.vGap2,
            InkWell(
              onTap: (){

              },
              child: Text(
                're_send_code'.tr(),
                style: AppText.fontSizeNormalTextStyle.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

final defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: AppText.fontSizeMediumTextStyle.copyWith(
    color: AppColors.white,
  ),
  decoration: BoxDecoration(
    border: Border.all(color: AppColors.darkPrimaryColor),
    borderRadius: BorderRadius.circular(20),
  ),
);

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(color: AppColors.darkPrimaryColor),
  borderRadius: BorderRadius.circular(8),
);

final submittedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration!.copyWith(
    color: AppColors.primaryColor.withOpacity(0.4),
  ),
);
