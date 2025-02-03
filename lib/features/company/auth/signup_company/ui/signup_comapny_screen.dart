

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/utils/Navigation/Navigation.dart';
import '../../../../../core/common/models/dropdown_model.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../../core/widgets/custom_widgets/custom_dropdown.dart';
import '../../../../../core/widgets/custom_widgets/custom_textfield.dart';
import '../../../../../core/widgets/pages/background_page.dart';
import '../../complete_company/ui/complete_company_screen.dart';


class SignUpCompanyScreen extends StatelessWidget {
  SignUpCompanyScreen({super.key});

  TextEditingController nameController = TextEditingController();

  TextEditingController codeController = TextEditingController();

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
                labelText: 'company_name'.tr()
            ),
            Gaps.vGap2,
            CustomDropdown(
              labelText: 'location'.tr(),
              items: [
                DropDownItem(id: 1, name: 'بغداد'),
                DropDownItem(id: 2, name: 'الموصل'),
                DropDownItem(id: 3, name: 'اربيل'),
              ],
              onChanged: (String selectedId) {
                print("Selected ID: $selectedId");
              },
            ),
            Gaps.vGap2,
            CustomTextField(
                controller: codeController,
                labelText: 'invitation_code'.tr()
            ),
            Gaps.vGap4,
            CustomButton(
              text: 'register'.tr(),
              onTap: (){
                Navigation.push(const CompleteCompanyAccountScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
