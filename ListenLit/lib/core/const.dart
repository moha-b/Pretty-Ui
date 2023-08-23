import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../features/explore/screens/explore_screen.dart';
import '../features/home/screens/dashboard_screen.dart';
import '../features/library/screens/mylibrary_screen.dart';

List<Widget> pages = [
  DashBoardScreen(),
  ExploreScreen(),
  const MyLibraryScreen(),
];
