import 'package:get_it/get_it.dart';
import 'package:isekai_habit/core/services/logger_service.dart';
import 'package:isekai_habit/data/repositories/habit_repository.dart';
import 'package:isekai_habit/domain/providers/habit_provider.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
   // ✅ Register Logger
  getIt.registerLazySingleton<LoggerService>(() => LoggerService());

  // ✅ Register HabitRepository (Injects Logger)
  getIt.registerLazySingleton<HabitRepository>(
      () => HabitRepository(getIt<LoggerService>()));

  // ✅ Register HabitProvider (Injects Logger + Repository)
  getIt.registerLazySingleton<HabitProvider>(
      () => HabitProvider(getIt<HabitRepository>(), getIt<LoggerService>()));
}
