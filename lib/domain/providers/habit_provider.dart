import 'package:flutter/foundation.dart';
import 'package:isekai_habit/core/services/logger_service.dart';
import 'package:isekai_habit/domain/entities/user.dart';
import 'package:isekai_habit/domain/entities/habit.dart';
import 'package:isekai_habit/data/repositories/habit_repository.dart';

class HabitProvider with ChangeNotifier , DiagnosticableTreeMixin{
  final LoggerService _logger;
  final HabitRepository _habitRepository;

  bool isLoading = true;
  User? _user;
  List<Habit> _habits = [];

  HabitProvider(this._habitRepository, this._logger) {
    fetchHabits();
  }

  User? get user => _user;
  List<Habit> get habits => _habits;

  /// ✅ Fetch Habits from Repository
  Future<void> fetchHabits() async {
    _logger.info("Fetching habits from repository...");

    try {
      _user = await _habitRepository.fetchUserData();
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