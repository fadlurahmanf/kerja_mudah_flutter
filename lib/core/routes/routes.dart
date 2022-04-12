// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:kerja_mudah/features/job/presentaion/pages/discover_job_screen.dart';
import 'package:kerja_mudah/features/onboard/presentation/pages/onboard_screen.dart';

class AppRoutes{
  AppRoutes._();

  static List<GetPage> pages = [
    GetPage(name: AppRoutesName.ONBOARD, page: () => OnBoardScreen()),
    GetPage(name: AppRoutesName.DISCOVER_JOB, page: () => DiscoverJobScreen()),
  ];

}

class AppRoutesName{
  static const String ONBOARD = "/onboard";
  static const String DISCOVER_JOB = "/discover_job";
}