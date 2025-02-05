
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wazzifni/core/common/style/gaps.dart';
import 'package:wazzifni/core/common/style/padding_insets.dart';
import 'package:wazzifni/core/utils/Navigation/Navigation.dart';
import 'package:wazzifni/features/user/privacy_policy/ui/widgets/privacy_policy_item.dart';
import '../../../../core/common/models/box_model.dart';
import '../../../../core/widgets/custom_widgets/custom_button.dart';
import '../../../../core/widgets/pages/custom_appbar_page.dart';
import '../../../company/auth/complete_company/ui/complete_company_screen.dart';
import '../../auth/complete_account/ui/complete_account_screen.dart';
import '../../home/ui/root_screen.dart';


class PrivacyPolicyScreen extends StatelessWidget {
  PrivacyPolicyScreen({super.key,this.isCompany = false});

  final bool isCompany;

  final List<BoxModel> items = [
    BoxModel(id: 1, title: 'خصوصية المستخدم', description: 'نحن نقدر خصوصيتك وملتزمون بحماية بياناتك الشخصية. تنطبق هذه السياسة على جميع البيانات التي نجمعها عند استخدامك لتطبيقنا.'),
    BoxModel(id: 1, title: 'البيانات التي نجمعها', description: 'معلومات شخصية: مثل الاسم، البريد الإلكتروني، رقم الهاتف عند التسجيل. بيانات استخدام التطبيق: مثل الوظائف التي تبحث عنها أو تحفظها.'),
    BoxModel(id: 1, title: 'مشاركة البيانات', description: 'لن نشارك بياناتك مع أطراف ثالثة دون إذن صريح منك، إلا إذا كان ذلك مطلوبًا بموجب القانون'),
    BoxModel(id: 1, title: 'أمان البيانات', description: 'نحن نستخدم تقنيات حديثة لحماية بياناتك من الوصول غير المصرح به'),
    BoxModel(id: 1, title: 'الشروط والأحكام', description: 'يجب استخدام التطبيق فقط للبحث عن الوظائف والتقدم إليها. يمنع استخدام التطبيق لأي أغراض غير قانونية. لسنا مسؤولين عن أي تواصل أو تعاملات تحدث خارج التطبيق.'),
  ];

  @override
  Widget build(BuildContext context) {
    return AppBarPage(
      title: 'privacy_policy'.tr(),
      body: SingleChildScrollView(
        child: Padding(
          padding: PaddingInsets.extraBigPaddingAll,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...List.generate(items.length, (index) => PrivacyPolicyItem(
                title: items[index].title,
                description: items[index].description,
              )),
              Gaps.vGap2,
              CustomButton(
                text: 'agree_and_continue'.tr(),
                onTap: (){
                  if(isCompany){
                    // Navigation.push(const CompleteCompanyAccountScreen());
                  }else{
                    Navigation.pushReplacement(const UserRootScreen());
                  }
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}




