

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/constants/appcolors.dart';
import 'package:wazzifni/core/utils/Navigation/Navigation.dart';
import '../../../../../core/constants/Validators.dart';
import '../../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../../core/widgets/custom_widgets/custom_textfield.dart';
import '../../../../../core/widgets/pages/profile_page.dart';


class AboutMeScreen extends StatefulWidget {
  const AboutMeScreen({super.key, this.aboutMe});

  final String? aboutMe;

  @override
  State<AboutMeScreen> createState() => _AboutMeScreenState();
}

class _AboutMeScreenState extends State<AboutMeScreen> {

  TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if(widget.aboutMe != null){
      controller.text = widget.aboutMe ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ProfileBackgroundPage(
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_outlined, color: AppColors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                Gaps.vGap4,
                CustomTextField(
                    controller: controller,
                    maxLines: 8,
                    labelText: 'account_info'.tr(),
                    hintText: 'tell_me'.tr(),
                    validator: Validators.validateEmptyValue,
                ),
                Gaps.vGap8,
                CustomButton(
                  text: 'continue'.tr(),
                  onTap: (){
                    if(_formKey.currentState!.validate()){
                      Navigation.pop(value: controller.text);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
