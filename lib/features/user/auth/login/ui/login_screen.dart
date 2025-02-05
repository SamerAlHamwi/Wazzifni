import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wazzifni/core/boilerplate/create_model/widgets/create_model.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/constants/appcolors.dart';
import 'package:wazzifni/core/utils/Navigation/Navigation.dart';
import 'package:wazzifni/features/user/auth/login/data/repository/auth_repository.dart';
import '../../../../../core/boilerplate/create_model/cubits/create_model_cubit.dart';
import '../../../../../core/constants/Validators.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../../core/widgets/custom_widgets/custom_textfield.dart';
import '../../../../../core/widgets/pages/background_page.dart';
import '../../signup/ui/signup_phone_screen.dart';
import '../../signup/ui/signup_screen.dart';
import '../../verify_phone/ui/verify_phone_screen.dart';
import '../data/use_case/login_use_case.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controller = TextEditingController();
  late CreateModelCubit loginCubit;
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
                  'welcome_back'.tr(),
                  style: AppText.fontSizeExtraLargeTextStyle,
                ),
                Text(
                  'login_hint'.tr(),
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
                            '964',
                            style: AppText.fontSizeNormalTextStyle.copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Gaps.hGap2,
                      Expanded(
                        child: CustomTextField(
                            controller: controller,
                            keyboardType: TextInputType.phone,
                            labelText: 'phone_number'.tr(),
                            validator: Validators.validatePhoneNumber,
                        ),
                      ),
                    ],
                  ),
                ),
                Gaps.vGap4,
                CreateModel(
                  onCubitCreated: (cubit) => loginCubit = cubit,
                  useCaseCallBack: (model) {
                    return LoginUseCase(AuthRepository()).call(
                      params: model,
                    );
                  },
                  onSuccess: (model) {
                    Navigation.push(
                      VerifyPhoneScreen(
                        loginParams: LoginParams(
                            dialCode: '964',
                            phoneNumber: controller.text.trim(),
                            userType: 1,
                            language: 'ar'),
                      ),
                    );
                  },
                  withValidation: false,
                  child: CustomButton(
                    text: 'login'.tr(),
                    onTap: () {
                      if(_formKey.currentState!.validate()){
                        loginCubit.createModel(
                            requestData: LoginParams(
                              dialCode: '964',
                              phoneNumber: controller.text.trim(),
                              userType: 1,
                            ));
                      }
                    },
                  ),
                ),
                Gaps.vGap2,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'no_account'.tr(),
                      style: AppText.fontSizeNormalTextStyle,
                    ),
                    InkWell(
                      onTap: () {
                        Navigation.push(const SignUpPhoneScreen());
                      },
                      child: Text(
                        'register'.tr(),
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
