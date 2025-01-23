

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/constants/app_assets.dart';
import 'package:wazzifni/core/constants/app_textStyle.dart';
import 'package:wazzifni/core/constants/appcolors.dart';
import 'package:wazzifni/core/widgets/custom_widgets/custom_button.dart';
import 'package:wazzifni/features/company/apply_job/ui/widgets/cv_widget.dart';
import '../../../../../core/widgets/pages/custom_appbar_page.dart';


class ApplicationDetailsScreen extends StatefulWidget {
  const ApplicationDetailsScreen({super.key});

  @override
  State<ApplicationDetailsScreen> createState() => _ApplicationDetailsScreenState();
}

class _ApplicationDetailsScreenState extends State<ApplicationDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return AppBarPage(
      title: 'طلب التوظيف',
      body: SingleChildScrollView(
        child: Padding(
          padding: PaddingInsets.extraBigPaddingAll,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: AppColors.boxShadow,
                  color: AppColors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 24,
                                  backgroundImage: AssetImage(AppAssets.companyLogo),
                                ),
                                Gaps.vGap2,
                                Text(
                                  'مصمم محترف',
                                  style: AppText.fontSizeMediumTextStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Gaps.vGap1,
                                Text(
                                  'اسم الشركة . بغداد / العراق',
                                  style: AppText.fontSizeNormalTextStyle.copyWith(
                                    color: AppColors.grey
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                          '• تم التقدم في 14 فبراير 2022 الساعة 11:30 صباحاً',
                          style: AppText.fontSizeNormalTextStyle,
                      ),
                      Text(
                          '• تم التحديث بواسطة الموظف منذ 8 ساعات',
                        style: AppText.fontSizeNormalTextStyle,
                      ),
                      Gaps.vGap1,
                      const Divider(),
                      Gaps.vGap1,
                      Text(
                        'تفاصيل الوظيفة',
                        style: AppText.fontSizeMediumTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gaps.vGap2,
                       Text(
                           '• دوام مكتبي',
                         style: AppText.fontSizeNormalTextStyle,
                       ),
                       Text(
                           '• دوام كامل',
                         style: AppText.fontSizeNormalTextStyle,
                       ),
                       Text(
                           '• سنة إلى ثلاث سنوات خبرة',
                         style: AppText.fontSizeNormalTextStyle,
                       ),
                      Gaps.vGap1,
                      const Divider(),
                      Gaps.vGap1,
                      Text(
                        'تفاصيل الإرسال',
                        style: AppText.fontSizeMediumTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gaps.vGap2,
                      Text(
                          '• السيرة الذاتية',
                        style: AppText.fontSizeNormalTextStyle,
                      ),
                      Gaps.vGap2,
                      const CvWidget(
                        isWithDelete: false,
                      ),
                    ],
                  ),
                ),
              ),
              Gaps.vGap4,
              CustomButton(
                  text: 'التقدم إلى المزيد من الوظائف',
                  onTap: (){

                  }
              ),
              Gaps.vGap2,
            ],
          ),
        ),
      ),
    );
  }
}