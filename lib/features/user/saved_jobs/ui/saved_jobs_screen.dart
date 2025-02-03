

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/common/style/gaps.dart';
import '../../../../core/common/style/padding_insets.dart';
import '../../../../core/widgets/pages/custom_appbar_page.dart';
import '../../jobs/ui/widgets/job_card_widget.dart';


class SavedJobsScreen extends StatefulWidget {
  const SavedJobsScreen({super.key});

  @override
  State<SavedJobsScreen> createState() => _SavedJobsScreenState();
}

class _SavedJobsScreenState extends State<SavedJobsScreen> {

  @override
  Widget build(BuildContext context) {
    return AppBarPage(
      title: 'saved_jobs'.tr(),
      body: SingleChildScrollView(
        child: Padding(
          padding: PaddingInsets.normalPaddingAll,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              JobCardWidget(
                width: 100.w,
              ),
              Gaps.vGap05,
              JobCardWidget(
                width: 100.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}