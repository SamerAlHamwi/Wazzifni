import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/common/style/gaps.dart';
import '../../../../core/common/style/padding_insets.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_textStyle.dart';
import '../../../../core/constants/appcolors.dart';
import '../../../../core/utils/Navigation/Navigation.dart';
import '../../../../core/widgets/pages/background_page.dart';
import '../../../user/jobs/ui/widgets/job_card_widget.dart';
import '../../user_apply/ui/user_apply_screen.dart';
import 'widgets/company_jobs_appbar.dart';
import 'widgets/user_apply_card.dart';

class CompanyJobsScreen extends StatefulWidget {
  const CompanyJobsScreen({super.key});

  @override
  State<CompanyJobsScreen> createState() => _CompanyJobsScreenState();
}

class _CompanyJobsScreenState extends State<CompanyJobsScreen> {
  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
      body: DefaultTabController(
        length: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CompanyJobsAppBar(),
            Expanded(
              child: TabBarView(
                children: [
                  const SingleChildScrollView(
                    child: Padding(
                      padding: PaddingInsets.normalPaddingAll,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          UserApplyCard(),
                          UserApplyCard(),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: PaddingInsets.normalPaddingAll,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          JobCardWidget(
                            width: 100.w,
                            isFromCompany: true,
                          ),
                          Gaps.vGap05,
                          JobCardWidget(
                            width: 100.w,
                            isFromCompany: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
