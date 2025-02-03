




import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/common/style/padding_insets.dart';
import '../../../../../core/widgets/custom_widgets/list_title_widget.dart';
import '../../../company_jobs/ui/widgets/user_apply_card.dart';


class LatestCompanyAppliesWidget extends StatelessWidget {
  const LatestCompanyAppliesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleListWidget(
          title: 'job_applications'.tr(),
          onTap: (){},
        ),
        const Padding(
          padding: PaddingInsets.bigPaddingHorizontal,
          child: Column(
            children: [
              UserApplyCard(),
              UserApplyCard(),
            ],
          ),
        ),
      ],
    );
  }
}
