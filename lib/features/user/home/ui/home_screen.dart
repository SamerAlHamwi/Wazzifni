

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/constants/app_assets.dart';
import 'package:wazzifni/core/constants/app_textStyle.dart';
import 'package:wazzifni/core/widgets/custom_widgets/custom_textfield.dart';
import 'package:wazzifni/features/user/home/ui/widgets/custom_jobs_widget.dart';
import 'package:wazzifni/features/user/home/ui/widgets/home_app_bar.dart';
import 'package:wazzifni/features/user/home/ui/widgets/latest_jobs_widget.dart';
import 'package:wazzifni/features/user/home/ui/widgets/my_requests_widget.dart';

import '../../../../core/constants/appcolors.dart';
import '../../../../core/widgets/custom_widgets/list_title_widget.dart';
import '../../jobs/ui/widgets/job_card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Column(
        children: [
          const HomeAppBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.vGap4,
                  const LatestJobsWidget(),
                  Gaps.vGap4,
                  const MyRequestsWidget(),
                  Gaps.vGap4,
                  const CustomJobsWidget(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}



