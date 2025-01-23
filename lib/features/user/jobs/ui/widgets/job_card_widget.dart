

import 'package:flutter/material.dart';
import 'package:wazzifni/features/company/company_job/ui/company_job_screen.dart';

import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/common/style/padding_insets.dart';
import '../../../../../core/constants/app_textStyle.dart';
import '../../../../../core/constants/appcolors.dart';
import '../../../../../core/utils/Navigation/Navigation.dart';

class JobCardWidget extends StatelessWidget {
  const JobCardWidget({
    super.key,
    this.width
  });

  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigation.push(const CompanyJobDetails());
      },
      child: Container(
        width: width ?? 260,
        padding: const EdgeInsets.all(1),
        margin: PaddingInsets.normalPaddingAll,
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
          boxShadow: AppColors.boxShadow,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          padding: PaddingInsets.cardPaddingHV,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      'مصمم محترف',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppText.fontSizeMediumTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.favorite_border_outlined,
                    color: AppColors.primaryColor,
                  ),
                ],
              ),
              Gaps.vGap4,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'شهرياً/',
                    style: AppText.fontSizeSmallTextStyle,
                  ),
                  Gaps.hGap1,
                  Text(
                    '\$15K',
                    style: AppText.fontSizeMediumTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'بغداد',
                    style: AppText.fontSizeSmallTextStyle,
                  ),
                  Text(
                    'منذ ساعة',
                    style: AppText.fontSizeSmallTextStyle.copyWith(
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              ),
              Gaps.vGap1,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: getAttributeWidth(),
                    padding: PaddingInsets.cardPaddingHV,
                    decoration: BoxDecoration(
                      color: AppColors.card1,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'دوام مكتبي',
                        style: AppText.fontSizeSmallTextStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Container(
                    width: getAttributeWidth(),
                    padding: PaddingInsets.cardPaddingHV,
                    decoration: BoxDecoration(
                      color: AppColors.card2,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'دوام كامل',
                        style: AppText.fontSizeSmallTextStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Container(
                    width: getAttributeWidth(),
                    padding: PaddingInsets.cardPaddingHV,
                    decoration: BoxDecoration(
                      color: AppColors.card3,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'مدير',
                        style: AppText.fontSizeSmallTextStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  getAttributeWidth(){
    if(width != null){
      return (width!/4);
    }else{
      return 75;
    }
  }
}