import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:isekai_habit/presentation/screens/habit_screen.dart';
import 'package:isekai_habit/presentation/screens/profile_screen.dart';
import 'package:isekai_habit/presentation/screens/root_screen.dart';
import 'package:isekai_habit/presentation/screens/login_screen.dart';
import 'package:isekai_habit/presentation/screens/setting_screen.dart';

/// The route configuration.
final GoRouter _router = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return ScaffoldWithNavBar(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          pageBuilder:
              (context, state) => NoTransitionPage(child: HabitScreen()),
        ),
        GoRoute(
          path: '/profile',
          pageBuilder:
              (context, state) =>
                  const NoTransitionPage(child: ProfileScreen()),
        ),
        GoRoute(
          path: '/login',
          pageBuilder:
              (context, state) =>
                  const NoTransitionPage(child: LoginScreen()),
        ),
        GoRoute(
          path: '/setting',
          pageBuilder:
              (context, state) =>
                  const NoTransitionPage(child: SettingScreen()),
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}
