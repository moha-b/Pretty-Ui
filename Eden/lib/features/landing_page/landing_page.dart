import 'package:eden/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../activity/screens/activity_view.dart';
import '../create_course/screens/create_course_view.dart';
import '../home/screens/home_view.dart';
import '../my_courses/screens/my_courses_view.dart';
import '../profile/screens/profile_view.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final List<Widget> _pages = [
    const HomeView(),
    const MyCoursesView(),
    const CreateCourseView(),
    const ActivityView(),
    const ProfileView(),
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      extendBody: true,
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        height: 80.h,
        padding: EdgeInsets.only(top: 5.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppSpacing.radiusForty),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.kPrimary.withOpacity(0.2),
              blurRadius: 7,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppSpacing.radiusForty),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            selectedItemColor: Colors.white,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.home_outlined,
                  color: Colors.grey,
                ),
                label: 'Home',
                activeIcon: Icon(
                  Icons.home,
                  color: isDarkMode(context) ? Colors.white : Colors.grey,
                ),
              ),
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.my_library_books_outlined,
                  color: Colors.grey,
                ),
                label: 'my Courses',
                activeIcon: Icon(
                  Icons.my_library_books,
                  color: isDarkMode(context) ? Colors.white : Colors.grey,
                ),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: const BoxDecoration(
                    color: AppColors.kPrimary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: AppColors.kWhite,
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.notifications_none_rounded),
                label: 'Activity',
                activeIcon: Icon(
                  Icons.notifications,
                  color: isDarkMode(context) ? Colors.white : Colors.grey,
                ),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person_outline, color: Colors.grey),
                label: 'Profile',
                activeIcon: Icon(
                  Icons.person_outline,
                  color: isDarkMode(context) ? Colors.white : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
