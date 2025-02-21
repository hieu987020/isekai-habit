import 'package:flutter/material.dart';
import 'package:isekai_habit/core/services/logger_service.dart';
import 'package:isekai_habit/domain/entities/user.dart';
import 'package:isekai_habit/data/repositories/habit_repository.dart';

class HabitProvider with ChangeNotifier {
  final HabitRepository _habitRepository;
  final LoggerService _logger;

  User? _user;
  bool _isLoading = true;

  HabitProvider(this._habitRepository, this._logger);

  User? get user => _user;
  bool get isLoading => _isLoading;

  Future<void> fetchHabits() async {
    try {
      _logger.info("Loading user habits...");
      _isLoading = true;
      notifyListeners();

      _user = await _habitRepository.fetchUserData();
      _logger.info("Habits loaded successfully.");
    } catch (e, stackTrace) {
      _logger.error("Error loading habits", error: e, {stackTrace: stackTrace});
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
