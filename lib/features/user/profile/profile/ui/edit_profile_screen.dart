



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wazzifni/core/widgets/custom_widgets/custom_textfield.dart';
import 'package:wazzifni/features/user/profile/profile/ui/widgets/profile_appbar.dart';
import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/common/style/padding_insets.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/constants/appcolors.dart';
import '../../../../../core/utils/Navigation/Navigation.dart';
import '../../../../../core/widgets/custom_widgets/custom_button.dart';



class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ProfileAppBar(isWithEdit: false,),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: PaddingInsets.bigPaddingAll,
                child: Column(
                  children: [
                    CustomTextField(
                        controller: TextEditingController(),
                      labelText: 'الاسم الكامل',
                      hintText: 'سامر الحموي',
                    ),
                    Gaps.vGap2,
                    CustomTextField(
                      controller: TextEditingController(),
                      labelText: 'تاريخ الولادة',
                      hintText: '1999-01-01',
                      suffixIcon: Icon(
                        Icons.calendar_month_rounded,
                        color: AppColors.black.withOpacity(0.5),
                      ),
                    ),
                    Gaps.vGap2,
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
                                '+964',
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
                                controller: TextEditingController(),
                                labelText: 'رقم الهاتف',
                                hintText: '12234567890',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gaps.vGap2,
                    CustomTextField(
                      controller: TextEditingController(),
                      labelText: 'الموقع',
                      hintText: 'بغداد، العراق',
                    ),
                    Gaps.vGap2,
                    CustomButton(
                      text: 'حفظ',
                      onTap: (){
                        Navigation.pop();
                      },
                    ),
                    Gaps.vGap2,
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
