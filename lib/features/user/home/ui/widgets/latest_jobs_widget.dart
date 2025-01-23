
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/common/style/padding_insets.dart';
import '../../../../../core/widgets/custom_widgets/list_title_widget.dart';
import '../../../jobs/ui/widgets/job_card_widget.dart';

class LatestJobsWidget extends StatelessWidget {
  const LatestJobsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleListWidget(
          title: 'وظائف اليوم',
          onTap: (){},
        ),
        Padding(
          padding: PaddingInsets.normalPaddingHorizontal,
          child: SizedBox(
            height: 160,
            width: 100.w,
            child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index) => const JobCardWidget()
            ),
          ),
        ),
      ],
    );
  }
}
