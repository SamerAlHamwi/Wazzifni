import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/utils/Navigation/Navigation.dart';
import '../../../../../core/boilerplate/create_model/cubits/create_model_cubit.dart';
import '../../../../../core/boilerplate/create_model/widgets/create_model.dart';
import '../../../../../core/common/data/common_data.dart';
import '../../../../../core/common/models/dropdown_model.dart';
import '../../../../../core/constants/Validators.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../../core/widgets/custom_widgets/custom_dropdown.dart';
import '../../../../../core/widgets/custom_widgets/custom_textfield.dart';
import '../../../../../core/widgets/pages/background_page.dart';
import '../../../../user/auth/login/data/model/create_account_response.dart';
import '../../../../user/auth/login/data/repository/auth_repository.dart';
import '../../../../user/auth/login/data/use_case/create_account_use_case.dart';
import '../../../../user/auth/login/data/use_case/login_use_case.dart';
import '../../complete_company/ui/complete_company_screen.dart';

class SignUpCompanyScreen extends StatefulWidget {
  const SignUpCompanyScreen({super.key, required this.loginParams});

  final LoginParams loginParams;

  @override
  State<SignUpCompanyScreen> createState() => _SignUpCompanyScreenState();
}

class _SignUpCompanyScreenState extends State<SignUpCompanyScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  late CreateModelCubit signUpCubit;
  final _formKey = GlobalKey<FormState>();
  int? cityId;

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
                Gaps.vGap2,
                Image.asset(
                  AppAssets.logo,
                  width: 150,
                  height: 150,
                ),
                Gaps.vGap2,
                Text(
                  'register_as_company'.tr(),
                  style: AppText.fontSizeExtraLargeTextStyle,
                ),
                Gaps.vGap2,
                CustomTextField(
                    controller: nameController,
                    labelText: 'company_name'.tr(),
                    validator: Validators.validateEmptyValue,
                ),
                Gaps.vGap2,
                CustomDropdown(
                  labelText: 'location'.tr(),
                  items: cityListModel.items!
                      .map((e) => DropDownItem(id: e.id!, name: e.name ?? ''))
                      .toList(),
                  onChanged: (String selectedId) {
                    setState(() {
                      cityId = int.parse(selectedId);
                    });
                  },
                ),
                Gaps.vGap2,
                CustomTextField(
                    controller: codeController,
                    labelText: 'invitation_code'.tr(),
                ),
                Gaps.vGap4,
                CreateModel(
                  onCubitCreated: (cubit) => signUpCubit = cubit,
                  useCaseCallBack: (model) {
                    return CreateAccountUseCase(AuthRepository()).call(
                      params: model,
                    );
                  },
                  onSuccess: (CreateUserModel model) {
                    Navigation.pushReplacement(
                      CompleteCompanyAccountScreen(
                        loginParams: widget.loginParams.copyWith(
                          fullName: nameController.text.trim(),
                          code: codeController.text.trim(),
                          cityId: cityId,
                        ),
                      ),
                    );
                  },
                  withValidation: false,
                  child: CustomButton(
                    text: 'register'.tr(),
                    onTap: () {
                      if(_formKey.currentState!.validate()){
                        if(cityId != null){
                          signUpCubit.createModel(
                            requestData: widget.loginParams.copyWith(
                              fullName: nameController.text.trim(),
                              code: codeController.text.trim(),
                            ),
                          );
                        }else{
                          Utils.showToast('please_select_city'.tr());
                        }
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
