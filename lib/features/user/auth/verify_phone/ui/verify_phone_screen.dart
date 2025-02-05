import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/utils/Navigation/Navigation.dart';
import 'package:wazzifni/core/utils/utils.dart';
import 'package:wazzifni/features/user/auth/signup/ui/signup_screen.dart';
import '../../../../../core/boilerplate/create_model/cubits/create_model_cubit.dart';
import '../../../../../core/boilerplate/create_model/widgets/create_model.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/constants/appcolors.dart';
import '../../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../../core/widgets/pages/background_page.dart';
import '../../../../company/auth/signup_company/ui/signup_comapny_screen.dart';
import '../../../privacy_policy/ui/privacy_policy_screen.dart';
import '../../login/data/repository/auth_repository.dart';
import '../../login/data/use_case/login_use_case.dart';
import '../../login/data/use_case/verify_phone_use_case.dart';

class VerifyPhoneScreen extends StatefulWidget {
  const VerifyPhoneScreen({
    super.key,
    this.isCompany = false,
    this.isForSignIn = true,
    this.code,
    required this.loginParams,
  });

  final bool isCompany;
  final bool isForSignIn;
  final LoginParams loginParams;
  final String? code;

  @override
  State<VerifyPhoneScreen> createState() => _VerifyPhoneScreenState();
}

class _VerifyPhoneScreenState extends State<VerifyPhoneScreen> {
  TextEditingController phoneController = TextEditingController();
  late CreateModelCubit verifyCubit;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.code != null) {
      phoneController.text = widget.code!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
      body: Padding(
        padding: PaddingInsets.extraBigPaddingAll,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gaps.vGap5,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Wazzifni',
                    style: AppText.fontSizeNormalTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Gaps.vGap8,
              Text(
                'enter_verification_code'.tr(),
                style: AppText.fontSizeExtraLargeTextStyle,
              ),
              Gaps.vGap1,
              Text(
                'sent_code'.tr(),
                style: AppText.fontSizeNormalTextStyle,
              ),
              Text(
                '${widget.loginParams.dialCode}-${widget.loginParams.phoneNumber}',
                style: AppText.fontSizeNormalTextStyle,
              ),
              Gaps.vGap4,
              Pinput(
                length: 6,
                controller: phoneController,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                // validator: (s) {
                //   return 'Pin is incorrect';
                // },
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onCompleted: (pin) => print(pin),
              ),
              Gaps.vGap4,
              CreateModel(
                onCubitCreated: (cubit) => verifyCubit = cubit,
                useCaseCallBack: (model) {
                  return VerifyPhoneUseCase(AuthRepository()).call(
                    params: model,
                  );
                },
                onSuccess: (model) {
                  if (widget.isCompany) {
                    Navigation.push(
                      SignUpCompanyScreen(
                        loginParams: widget.loginParams
                            .copyWith(code: phoneController.text),
                      ),
                    );
                  } else {
                    Navigation.push(
                      SignUpScreen(
                        loginParams: widget.loginParams
                            .copyWith(code: phoneController.text),
                      ),
                    );
                  }
                },
                withValidation: false,
                child: CustomButton(
                  text: 'continue'.tr(),
                  onTap: () {
                    if(phoneController.text.isNotEmpty && phoneController.text.length == 6){
                      verifyCubit.createModel(
                        requestData: LoginParams(
                          dialCode: widget.loginParams.dialCode,
                          phoneNumber: widget.loginParams.phoneNumber,
                          userType: widget.loginParams.userType,
                          language: widget.loginParams.language,
                          code: phoneController.text,
                        ),
                      );
                    }else{
                      Utils.showToast('please_enter_pin'.tr());
                    }
                  },
                ),
              ),
              Gaps.vGap2,
              InkWell(
                onTap: () {},
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
      ),
    );
  }
}

final defaultPinTheme = PinTheme(
  width: 35,
  height: 35,
  textStyle: AppText.fontSizeMediumTextStyle.copyWith(
    color: AppColors.white,
  ),
  decoration: BoxDecoration(
    border: Border.all(color: AppColors.darkPrimaryColor),
    borderRadius: BorderRadius.circular(12),
  ),
);

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(color: AppColors.darkPrimaryColor),
  borderRadius: BorderRadius.circular(8),
);

final submittedPinTheme = defaultPinTheme.copyWith(
  width: 35,
  height: 35,
  decoration: defaultPinTheme.decoration!.copyWith(
    color: AppColors.primaryColor.withOpacity(0.4),
  ),
);
