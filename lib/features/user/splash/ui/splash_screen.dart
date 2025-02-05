
import 'package:flutter/material.dart';
import 'package:wazzifni/core/utils/Navigation/Navigation.dart';
import 'package:wazzifni/core/widgets/pages/background_page.dart';
import 'package:wazzifni/features/user/auth/welcome/ui/welcome_screen.dart';
import '../../../../core/common/data/common_data.dart';
import '../../../../core/constants/app_assets.dart';
import '../../auth/login/data/repository/auth_repository.dart';
import '../../auth/login/data/use_case/cities_use_case.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    getCities();
  }

  getCities(){
    GetCitiesUseCase(AuthRepository()).call(
      params: CitiesParams(),
    ).then((value){
      cityListModel = value.data!;
      Navigation.pushReplacement(const WelcomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
        body: Center(
          child: Image.asset(
            AppAssets.logo,
            width: 150,
            height: 150,
          ),
        )
    );
  }
}
