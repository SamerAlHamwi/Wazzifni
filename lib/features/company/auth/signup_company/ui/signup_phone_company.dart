


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/utils/Navigation/Navigation.dart';
import 'package:wazzifni/features/user/auth/login/data/model/login_response.dart';
import 'package:wazzifni/features/user/auth/verify_phone/ui/verify_phone_screen.dart';
import '../../../../../core/boilerplate/create_model/cubits/create_model_cubit.dart';
import '../../../../../core/boilerplate/create_model/widgets/create_model.dart';
import '../../../../../core/common/models/enums.dart';
import '../../../../../core/constants/Validators.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/constants/appcolors.dart';
import '../../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../../core/widgets/custom_widgets/custom_textfield.dart';
import '../../../../../core/widgets/pages/background_page.dart';
import '../../../../user/auth/login/data/repository/auth_repository.dart';
import '../../../../user/auth/login/data/use_case/login_use_case.dart';
import '../../../../user/auth/login/data/use_case/sign_up_phone_use_case.dart';



class SignUpCompanyPhoneScreen extends StatefulWidget {
  const SignUpCompanyPhoneScreen({super.key});

  @override
  State<SignUpCompanyPhoneScreen> createState() => _SignUpCompanyPhoneScreenState();
}

class _SignUpCompanyPhoneScreenState extends State<SignUpCompanyPhoneScreen> {
  TextEditingController phoneController = TextEditingController();
  late CreateModelCubit signUpCubit;
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
                Gaps.vGap2,
                Text(
                  'register'.tr(),
                  style: AppText.fontSizeExtraLargeTextStyle,
                ),
                Gaps.vGap2,
                SizedBox(
                  width: 100.w,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                            controller: phoneController,
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
                  onCubitCreated: (cubit) => signUpCubit = cubit,
                  useCaseCallBack: (model) {
                    return SignUpPhoneUseCase(AuthRepository()).call(
                      params: model,
                    );
                  },
                  onSuccess: (LoginModel model) {
                    Navigation.push(
                      VerifyPhoneScreen(
                        isForSignIn: false,
                        isCompany: true,
                        code: model.code,
                        loginParams: LoginParams(
                          dialCode: '964',
                          phoneNumber: phoneController.text.trim(),
                          userType: UserType.company.index,
                          language: 'ar',
                        ),
                      ),
                    );
                  },
                  withValidation: false,
                  child: CustomButton(
                    text: 'register'.tr(),
                    onTap: () {
                      if(_formKey.currentState!.validate()){
                        signUpCubit.createModel(
                          requestData: LoginParams(
                            dialCode: '964',
                            phoneNumber: phoneController.text.trim(),
                            userType: UserType.company.index,
                            language: 'ar',
                          ),
                        );
                      }
                    },
                  ),
                ),
                Gaps.vGap4,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
