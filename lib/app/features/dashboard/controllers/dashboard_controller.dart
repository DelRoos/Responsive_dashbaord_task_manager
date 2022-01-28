// part of dashborad;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_dashboard/app/constant/app_constant.dart';
import 'package:task_dashboard/app/shared_components/card_task.dart';
import 'package:task_dashboard/app/shared_components/selection_button.dart';
import 'package:task_dashboard/app/shared_components/task_progress.dart';
import 'package:task_dashboard/app/shared_components/user_profile.dart';

class DashboardController extends GetxController {
  final dataProfile = const UserProfileData(
    image: AssetImage(ImageRasterPath.man),
    jobDesk: "Mobile, Web Developper and Scraper",
    name: "Toungsi Roosvelt",
  );

  final member = ['Delano Roosvelt', 'Emerite Premier'];

  final dataTask = const TaskProgressData(totalTask: 5, totalCompleted: 1);

  final taskInProgress = [
    CardTaskData(
    label: "Determine meeting schedule",
    jobDesk: "System Analyst",
    dueDate: DateTime.now().add(const Duration(minutes: 50)),
  ),
    CardTaskData(
      label: "Personal branding",
      jobDesk: "Marketing",
      dueDate: DateTime.now().add(const Duration(hours: 4)),
    ),
    CardTaskData(
      label: "UI UX",
      jobDesk: "Design",
      dueDate: DateTime.now().add(const Duration(days: 2)),
    ),
    CardTaskData(
      label: "Determine meeting schedule",
      jobDesk: "System Analyst",
      dueDate: DateTime.now().add(const Duration(minutes: 50)),
    ),
    ];

  void onPressedProfil() {}
  void onSelectedMainMenu(int index, SelectionButtonData value) {}
  void onSelectedTaskMenu(int index, String value) {}
  void searchTask(String value) {}
}
