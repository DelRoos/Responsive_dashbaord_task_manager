library dashboard;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_dashboard/app/features/dashboard/controllers/dashboard_controller.dart';
import 'package:task_dashboard/app/shared_components/user_profile.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Flexible(
            flex: 3,
            child: _buildSideBar(),
          ),
          Flexible(
            flex: 10,
            child: _buildTaskContentTask(),
          ),
          Flexible(
            flex: 4,
            child: _buildCalendarContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildSideBar() {
    return Column(
      children: [
        UserProfile(
          data: controller.dataProfile,
          onPressed: controller.onPressedProfil,
        ),
      ],
    );
  }

  Widget _buildTaskContentTask() {
    return Container();
  }

  Widget _buildCalendarContent() {
    return Container();
  }
}
