// part of dashborad;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_dashboard/app/constant/app_constant.dart';
import 'package:task_dashboard/app/shared_components/selection_button.dart';
import 'package:task_dashboard/app/shared_components/user_profile.dart';

class DashboardController extends GetxController {
  final dataProfile = const UserProfileData(
    image: AssetImage(ImageRasterPath.man),
    jobDesk: "Mobile, Web Developper and Scraper",
    name: "Toungsi Roosvelt",
  );
  final member = ['Delano Roosvelt', 'Emerite Premier'];

  void onPressedProfil() {}
  void onSelectedMainMenu(int index, SelectionButtonData value) {}
  void onSelectedTaskMenu(int index, String value) {}
}
