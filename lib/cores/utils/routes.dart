part of 'util.dart';

Map<String, Widget Function(BuildContext)> route = {
  LoginView.routeName: (context) => const LoginView(),
  DashboardView.routeName: (context) => const DashboardView(),
  HomeView.routeName: (context) => const HomeView(),
};
