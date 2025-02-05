

import 'package:flutter/material.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';

import '../../common/style/gaps.dart';
import '../../constants/app_textStyle.dart';
import '../../constants/appcolors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final int maxLines;
  final bool isWithBorder;
  final bool isRequired;
  final bool isEnabled;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.labelText,
    this.suffixIcon,
    this.keyboardType,
    this.maxLines = 1,
    this.isWithBorder = true,
    this.isEnabled = true,
    this.isRequired = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (isRequired)
                    Padding(
                      padding: PaddingInsets.lowPaddingHorizontal,
                      child: Text(
                        '*',
                        style: AppText.fontSizeLargeTextStyle.copyWith(
                          color: AppColors.gold,
                        ),
                      ),
                    ),
                  Text(
                    labelText!,
                    style: AppText.fontSizeNormalTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Gaps.vGap1,
            ],
          ),
        FormField<String>(
          validator: validator,
          builder: (FormFieldState<String> fieldState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: isWithBorder
                        ? const LinearGradient(
                      colors: [Colors.purple, Colors.blue],
                    )
                        : null,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: AppColors.boxShadow,
                    ),
                    child: Center(
                      child: TextFormField(
                        controller: controller,
                        keyboardType: keyboardType,
                        enabled: isEnabled,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          border: InputBorder.none,
                          hintText: hintText ?? '',
                          hintStyle: AppText.fontSizeNormalTextStyle.copyWith(
                            color: AppColors.grey,
                          ),
                          suffixIcon: suffixIcon,
                        ),
                        maxLines: maxLines,
                        style: AppText.fontSizeNormalTextStyle,
                        onChanged: (value) {
                          fieldState.didChange(value); // Update FormField state
                        },
                      ),
                    ),
                  ),
                ),
                if (fieldState.hasError) // Show error below field
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 4),
                    child: Text(
                      fieldState.errorText!,
                      style: AppText.fontSizeNormalTextStyle.copyWith(
                        color: AppColors.red,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}



