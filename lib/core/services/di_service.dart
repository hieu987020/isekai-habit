import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:isekai_habit/core/services/logger_service.dart';
import 'package:isekai_habit/data/repositories/habit_repository.dart';
import 'package:isekai_habit/domain/providers/habit_provider.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  // ✅ Register Logger
  getIt.registerLazySingleton<LoggerService>(() => LoggerService());

  // ✅ Register Dio
  getIt.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: 'http://127.0.0.1:8000', // Set base URL for API
        // baseUrl:
        //     'https://isekai-habit-api-production.up.railway.app', // Set base URL for API
        connectTimeout: const Duration(
          seconds: 10,
        ), // Prevents long waiting time
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json'}, // Default headers
      ),
    ),
  );

  // ✅ Register HabitRepository (Injects Logger)
  getIt.registerLazySingleton<HabitRepository>(
    () => HabitRepository(getIt<LoggerService>(), getIt<Dio>()),
  );

  // ✅ Register HabitProvider (Injects Logger + Repository)
  getIt.registerLazySingleton<HabitProvider>(
    () => HabitProvider(getIt<HabitRepository>(), getIt<LoggerService>()),
  );
}
