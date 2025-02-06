import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wazzifni/core/common/data/common_data.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/utils/Navigation/Navigation.dart';
import 'package:wazzifni/core/utils/utils.dart';
import 'package:wazzifni/features/user/auth/verify_phone/ui/verify_phone_screen.dart';
import '../../../../../core/boilerplate/create_model/cubits/create_model_cubit.dart';
import '../../../../../core/boilerplate/create_model/widgets/create_model.dart';
import '../../../../../core/common/models/dropdown_model.dart';
import '../../../../../core/constants/Validators.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../../core/widgets/custom_widgets/custom_dropdown.dart';
import '../../../../../core/widgets/custom_widgets/custom_textfield.dart';
import '../../../../../core/widgets/pages/background_page.dart';
import '../../../home/ui/root_screen.dart';
import '../../../privacy_policy/ui/privacy_policy_screen.dart';
import '../../complete_account/ui/complete_account_screen.dart';
import '../../login/data/model/create_account_response.dart';
import '../../login/data/repository/auth_repository.dart';
import '../../login/data/use_case/create_account_use_case.dart';
import '../../login/data/use_case/login_use_case.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key, required this.loginParams});

  final LoginParams loginParams;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  int? cityId;
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
                  'register'.tr(),
                  style: AppText.fontSizeExtraLargeTextStyle,
                ),
                Gaps.vGap2,
                CustomTextField(
                  controller: nameController,
                  labelText: 'full_name'.tr(),
                  validator: Validators.validateEmptyValue,
                ),
                Gaps.vGap1,
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
                Gaps.vGap1,
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
                      CompleteAccountScreen(
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
                      if (_formKey.currentState!.validate()) {
                        if (cityId != null) {
                          signUpCubit.createModel(
                            requestData: widget.loginParams.copyWith(
                              fullName: nameController.text.trim(),
                              code: codeController.text.trim(),
                              cityId: cityId,
                            ),
                          );
                        } else {
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
