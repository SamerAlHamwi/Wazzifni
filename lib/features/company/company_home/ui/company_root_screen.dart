


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wazzifni/core/constants/appcolors.dart';
import 'package:wazzifni/core/utils/Navigation/Navigation.dart';
import '../../../../core/constants/app_assets.dart';
import '../../add_job/ui/add_job_screen.dart';
import '../../company_jobs/ui/company_jobs_screen.dart';
import 'company_home_screen.dart';


class CompanyRootScreen extends StatefulWidget {
  const CompanyRootScreen({super.key});

  @override
  State<CompanyRootScreen> createState() => _CompanyRootScreenState();
}

class _CompanyRootScreenState extends State<CompanyRootScreen> {

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const CompanyHomePage(),
    const CompanyJobsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Stack(
        alignment: Alignment.center,
        children: [
          BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: AppColors.black,
            unselectedItemColor: AppColors.black,
            items: [
              BottomNavigationBarItem(
                icon: _buildNavIcon(AppAssets.homeNav,0),
                label: '',
              ),
              BottomNavigationBarItem(
                  icon: _buildNavIcon(AppAssets.profileNav,1),
                  label: ''),
            ],
          ),
          Positioned(
            bottom: 8,
            child: SizedBox(
              width: 40,
              height: 40,
              child: FloatingActionButton(
                onPressed: () {
                  Navigation.push(const AddJobScreen());
                },
                backgroundColor: AppColors.primaryColor,
                child: const Icon(Icons.add, size: 20, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavIcon(String assetPath, int index) {
    return SvgPicture.asset(
      assetPath,
      height: 25,
      width: 35,
      color: _selectedIndex == index ? AppColors.primaryColor : AppColors.navInActiveColor,
    );
  }
}

