

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wazzifni/core/constants/appcolors.dart';
import 'package:wazzifni/features/user/home/ui/home_screen.dart';
import 'package:wazzifni/features/user/saved_jobs/ui/saved_jobs_screen.dart';
import 'package:wazzifni/features/user/search/ui/search_screen.dart';
import '../../../../core/constants/app_assets.dart';
import '../../profile/profile/ui/profile_screen.dart';


class UserRootScreen extends StatefulWidget {
  const UserRootScreen({super.key});

  @override
  State<UserRootScreen> createState() => _UserRootScreenState();
}

class _UserRootScreenState extends State<UserRootScreen> {

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const SearchScreen(),
    const SavedJobsScreen(),
    const ProfileScreen(),
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
      bottomNavigationBar: BottomNavigationBar(
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
              icon: _buildNavIcon(AppAssets.searchNav,1),
              label: ''),
          BottomNavigationBarItem(
              icon: _buildNavIcon(AppAssets.saveNav,2),
              label: ''),
          BottomNavigationBarItem(
              icon: _buildNavIcon(AppAssets.profileNav,3),
              label: ''),
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

