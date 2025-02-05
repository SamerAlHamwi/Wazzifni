

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/common/style/padding_insets.dart';
import '../../../../../core/constants/Validators.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/constants/appcolors.dart';
import '../../../../../core/utils/Navigation/Navigation.dart';
import '../../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../../core/widgets/custom_widgets/custom_textfield.dart';
import '../../../../../core/widgets/pages/background_page.dart';
import '../../../../user/auth/verify_phone/ui/verify_phone_screen.dart';
import '../../signup_company/ui/signup_comapny_screen.dart';
import '../../signup_company/ui/signup_phone_company.dart';


class LoginCompanyScreen extends StatefulWidget {
  const LoginCompanyScreen({super.key});

  @override
  State<LoginCompanyScreen> createState() => _LoginCompanyScreenState();
}

class _LoginCompanyScreenState extends State<LoginCompanyScreen> {
  TextEditingController controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
      body: SingleChildScrollView(
        child: Padding(
          padding: PaddingInsets.extraBigPaddingAll,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gaps.vGap4,
                Image.asset(
                  AppAssets.logo,
                  width: 180,
                  height: 180,
                ),
                Text(
                  'welcome_back'.tr(),
                  style: AppText.fontSizeExtraLargeTextStyle,
                ),
                Text(
                  'find_employee'.tr(),
                  style: AppText.fontSizeNormalTextStyle,
                ),
                Gaps.vGap8,
                SizedBox(
                  width: 100.w,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
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
                            '964',
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
                            labelText: 'phone_number'.tr(),
                            validator: Validators.validatePhoneNumber,
                        ),
                      ),
                    ],
                  ),
                ),
                Gaps.vGap4,
                CustomButton(
                  text: 'login'.tr(),
                  onTap: (){
                    // Navigation.push(const VerifyPhoneScreen(isCompany: true,));
                  },
                ),
                Gaps.vGap2,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'no_company_account'.tr(),
                      style: AppText.fontSizeNormalTextStyle,
                    ),
                    InkWell(
                      onTap: (){
                        Navigation.push(const SignUpCompanyPhoneScreen());
                      },
                      child: Text(
                        'register_as_company'.tr(),
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
        ),
      ),
    );
  }
}
