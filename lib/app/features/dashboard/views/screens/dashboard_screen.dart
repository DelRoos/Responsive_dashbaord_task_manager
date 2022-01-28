library dashboard;

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_dashboard/app/constant/app_constant.dart';
import 'package:task_dashboard/app/features/dashboard/controllers/dashboard_controller.dart';
import 'package:task_dashboard/app/shared_components/selection_button.dart';
import 'package:task_dashboard/app/shared_components/simple_selection_button.dart';
import 'package:task_dashboard/app/shared_components/simple_user_profile.dart';
import 'package:task_dashboard/app/shared_components/user_profile.dart';

part '../components/main_menu.dart';
part '../components/member.dart';
part '../components/task_menu.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Flexible(
            flex: 3,
            child: SingleChildScrollView(
              child: _buildSideBar(context),
            ),
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

  Widget _buildSideBar(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: UserProfile(
            data: controller.dataProfile,
            onPressed: controller.onPressedProfil,
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: _MainMenu(
            onSelected: controller.onSelectedMainMenu,
          ),
        ),
        const Divider(
          indent: 20,
          thickness: 1,
          endIndent: 20,
          height: 60,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: _Member(member: controller.member),
        ),
        const SizedBox(height: kSpacing),
        _TaskMenu(onSelected: controller.onSelectedTaskMenu),
        const SizedBox(height: kSpacing),
        Padding(
          padding: const EdgeInsets.all(kSpacing),
          child: Text(
            "2022 Tydr@corp licence",
            style: Theme.of(context).textTheme.caption,
          ),
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
