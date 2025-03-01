import 'package:flutter/material.dart';
import 'package:isekai_habit/core/services/logger_service.dart';
import 'package:isekai_habit/core/services/di_service.dart';
import 'package:isekai_habit/domain/providers/auth_provider.dart';
import 'package:isekai_habit/domain/providers/habit_provider.dart';
import 'package:isekai_habit/domain/providers/settings_provider.dart';
import 'package:isekai_habit/routes.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // ✅ Setup Dependency Injection & Logger
  setupLocator();

  final logger = getIt<LoggerService>();
  try {
    logger.info("Starting Isekai Habit app...");
    runApp(MyAppWithProviders());
  } catch (e, stackTrace) {
    logger.error("Error during app startup", error: e, {
      stackTrace: stackTrace,
    });
  }
}

class MyAppWithProviders extends StatelessWidget {
  const MyAppWithProviders({super.key});

  @override
  Widget build(BuildContext context) {
    final providers = [
      ChangeNotifierProvider(create: (_) => getIt<HabitProvider>()),
      ChangeNotifierProvider(create: (_) => getIt<AuthProvider>()),
      ChangeNotifierProvider(create: (_) => getIt<SettingsProvider>()),
    ];
    return MultiProvider(providers: providers, child: const MyApp());
  }
}
