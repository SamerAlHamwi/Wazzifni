




import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/features/user/notifications/ui/widgets/notification_card.dart';
import '../../../../../core/widgets/pages/custom_appbar_page.dart';


class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {

  @override
  Widget build(BuildContext context) {
    return AppBarPage(
      title: 'notifications'.tr(),
      body: const SingleChildScrollView(
        child: Padding(
          padding: PaddingInsets.extraBigPaddingAll,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NotificationCard(
                title: "تم ارسال طلب التوظيف",
                description: "تقدمت بطلب توظيف لشركة غوغل ستقوم الشركة بمراجعة طلبك",
                time: "منذ ساعتين",
                logo: Icons.ac_unit,
              ),
              SizedBox(height: 16),
              NotificationCard(
                title: "تم ارسال طلب التوظيف",
                description: "تقدمت بطلب توظيف لشركة غوغل ستقوم الشركة بمراجعة طلبك",
                time: "منذ ساعتين",
                logo: Icons.sports_basketball,
              ),
            ],
          ),
        ),
      ),
    );
  }
}




