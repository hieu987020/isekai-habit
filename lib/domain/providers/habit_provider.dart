import 'package:flutter/foundation.dart';
import 'package:isekai_habit/core/services/logger_service.dart';
import 'package:isekai_habit/domain/entities/user_entity.dart';
import 'package:isekai_habit/domain/entities/habit_entity.dart';
import 'package:isekai_habit/data/repositories/habit_repository.dart';

class HabitProvider with ChangeNotifier, DiagnosticableTreeMixin {
  final LoggerService _logger;
  final HabitRepository _habitRepository;

  bool isLoading = true;
  UserEntity? _user;
  List<HabitEntity> _habits = [];

  HabitProvider(this._habitRepository, this._logger) {
    fetchHabits();
  }

  UserEntity? get user => _user;
  List<HabitEntity> get habits => _habits;

  /// ✅ Fetch Habits from Repository
  Future<void> fetchHabits() async {
    _logger.info("Fetching habits from repository...");
    try {
      _user = await _habitRepository.fetchUser();
      _habits = _user!.habits;
      _logger.info("Habits loaded successfully.");
    } catch (e, stackTrace) {
      _logger.error("Error loading habits", error: e, {stackTrace: stackTrace});
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
