



import 'package:flutter/material.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/widgets/pages/background_page.dart';
import 'package:wazzifni/features/company/company_home/ui/widgets/company_home_appbar.dart';
import '../../../../core/constants/appcolors.dart';
import 'widgets/company_latest_applies.dart';
import 'widgets/company_latest_jobs.dart';


class CompanyHomePage extends StatelessWidget {
  const CompanyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
      body: Column(
        children: [
          const CompanyHomeAppBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.vGap4,
                  const LatestCompanyAppliesWidget(),
                  Gaps.vGap4,
                  const LatestCompanyJobsWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



