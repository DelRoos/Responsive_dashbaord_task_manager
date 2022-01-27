import 'package:get/route_manager.dart';
import 'package:task_dashboard/app/features/dashboard/bindings/dashboard_binding.dart';
import 'package:task_dashboard/app/features/dashboard/views/screens/dashboard_screen.dart';
part 'app_routes.dart';

class AppPages {
  static const initial = Routes.dashboard;

  static final routes = [
    GetPage(
      name: _Paths.dashboard,
      page: () => const DashboardScreen(),
      binding: DashboardBinding(),
    ),
  ];
}
