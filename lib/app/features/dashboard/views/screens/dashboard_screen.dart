library dashboard;

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task_dashboard/app/constant/app_constant.dart';
import 'package:task_dashboard/app/features/dashboard/controllers/dashboard_controller.dart';
import 'package:task_dashboard/app/shared_components/card_task.dart';
import 'package:task_dashboard/app/shared_components/header_text.dart';
import 'package:task_dashboard/app/shared_components/list_task_assigned.dart';
import 'package:task_dashboard/app/shared_components/list_task_date.dart';
import 'package:task_dashboard/app/shared_components/responsive_builder.dart';
import 'package:task_dashboard/app/shared_components/search_field.dart';
import 'package:task_dashboard/app/shared_components/selection_button.dart';
import 'package:task_dashboard/app/shared_components/simple_selection_button.dart';
import 'package:task_dashboard/app/shared_components/simple_user_profile.dart';
import 'package:task_dashboard/app/shared_components/task_progress.dart';
import 'package:task_dashboard/app/shared_components/user_profile.dart';
import 'package:task_dashboard/app/utils/helpers/app_helpers.dart';

part '../components/main_menu.dart';
part '../components/member.dart';
part '../components/task_menu.dart';
part '../components/task_in_progress.dart';
part '../components/header_weekly_task.dart';
part '../components/weekly_task.dart';
part '../components/task_group.dart';
part '../components/bottom_navbar.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: controller.scaffoldKey,
        drawer: ResponsiveBuilder.isDesktop(context)
            ? null
            : Drawer(
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: _buildSideBar(context),
                  ),
                ),
              ),
        bottomNavigationBar:
            ResponsiveBuilder.isDesktop(context) ? null : const _BottomNavBar(),
        body: ResponsiveBuilder(
          mobileBuilder: (context, constraints) {
            return SafeArea(
              child: SingleChildScrollView(
                controller: ScrollController(),
                child: Column(
                  children: [
                    _buildTaskContentTask(
                      onPressedMenu: () => controller.openDrawer(),
                    ),
                    _buildCalendarContent(),
                  ],
                ),
              ),
            );
          },
          tabletBuilder: (context, constraints) {
            return SafeArea(
              child: Row(
                children: [
                  Flexible(
                    flex: constraints.maxWidth > 800 ? 8 : 7,
                    child: SingleChildScrollView(
                      controller: ScrollController(),
                      child: _buildTaskContentTask(
                        onPressedMenu: () => controller.openDrawer(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: const VerticalDivider(),
                  ),
                  Flexible(
                    flex: 4,
                    child:
                        SingleChildScrollView(child: _buildCalendarContent()),
                  ),
                ],
              ),
            );
          },
          desktopBuilder: (context, constraints) {
            return Row(
              children: [
                Flexible(
                  flex: constraints.maxWidth > 1350 ? 3 : 4,
                  child: SingleChildScrollView(
                    child: _buildSideBar(context),
                  ),
                ),
                Flexible(
                  flex: constraints.maxWidth > 1350 ? 10 : 9,
                  child: SingleChildScrollView(child: _buildTaskContentTask()),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: const VerticalDivider(),
                ),
                Flexible(
                  flex: 4,
                  child: SingleChildScrollView(child: _buildCalendarContent()),
                ),
              ],
            );
          },
        ));
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

  Widget _buildTaskContentTask({Function()? onPressedMenu}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: kSpacing),
          Row(
            children: [
              if (onPressedMenu != null)
                Padding(
                  padding: const EdgeInsets.only(right: kSpacing / 2),
                  child: IconButton(
                    onPressed: onPressedMenu,
                    icon: const Icon(
                      Icons.menu,
                    ),
                  ),
                ),
              Expanded(
                child: SearchField(
                  onSearch: controller.searchTask,
                  hintText: "Search task...",
                ),
              ),
            ],
          ),
          const SizedBox(height: kSpacing),
          Row(
            children: [
              Expanded(
                child: HeaderText(
                  data: DateTime.now().formatdMMMMY(),
                ),
              ),
              // const Spacer(),
              const SizedBox(height: kSpacing / 2),

              SizedBox(
                width: 200,
                child: TaskProgress(data: controller.dataTask),
              ),
            ],
          ),
          const SizedBox(height: kSpacing),
          _TaskInProgress(data: controller.taskInProgress),
          const SizedBox(height: kSpacing),
          const _HeaderWeeklyTask(),
          const SizedBox(height: kSpacing),
          _WeeklyTask(
            data: controller.weeklyTask,
            onPressed: controller.onPressedTask,
            onPressedAssign: controller.onPressedAssignTask,
            onPressedMember: controller.onPressedMemberTask,
          )
        ],
      ),
    );
  }

  Widget _buildCalendarContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: Column(
        children: [
          const SizedBox(height: kSpacing),
          Row(
            children: [
              const HeaderText(data: "Calendar"),
              IconButton(
                onPressed: controller.onPressedCalendar,
                icon: const Icon(EvaIcons.calendar),
                tooltip: "calendar",
              )
            ],
          ),
          ...controller.taskGroup
              .map((e) => _TaskGroup(
                  title: DateFormat('d MMMM').format(e[0].date),
                  data: e,
                  onPressed: controller.onPressedTaskGroup))
              .toList()
        ],
      ),
    );
  }
}
