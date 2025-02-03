


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/common/style/padding_insets.dart';
import '../../../../../core/widgets/custom_widgets/list_title_widget.dart';
import '../../../../user/jobs/ui/widgets/job_card_widget.dart';


class LatestCompanyJobsWidget extends StatelessWidget {
  const LatestCompanyJobsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleListWidget(
          title: 'our_jobs'.tr(),
          onTap: (){},
        ),
        Padding(
          padding: PaddingInsets.bigPaddingHorizontal,
          child: Column(
            children: [
              JobCardWidget(
                width: 100.w,
                isFromCompany: true,
              ),
              JobCardWidget(
                width: 100.w,
                isFromCompany: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
