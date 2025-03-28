import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:isekai_habit/core/services/logger_service.dart';
import 'package:isekai_habit/data/models/habit_model.dart';
import 'package:isekai_habit/data/models/user_model.dart';
import 'package:isekai_habit/domain/entities/user_entity.dart';
import 'dart:math';

class HabitRepository {
  final LoggerService _logger;
  final Dio _dio;

  HabitRepository(this._logger, this._dio);

  /// Fetch user data and return UserEntity
  Future<UserEntity> fetchUser() async {
    try {
      // final String endpoint = "/habits"; // Only the endpoint
      // final String fullUrl = "${_dio.options.baseUrl}$endpoint"; // Full URL

      // _logger.info("Fetching user data from: $fullUrl"); // ✅ Log API URL

      // // ✅ Step 1: Fetch user data (Includes habit data)
      // final response = await _dio.get(endpoint);

      // if (response.statusCode != 200) {
      //   _logger.error(
      //     "Failed to fetch user data: ${response.statusCode}",
      //     Exception('HTTP error'),
      //   );
      //   throw Exception('Failed to fetch user data');
      // }

      // // ✅ Extract user data
      // final Map<String, dynamic> userData = response.data;

      // // ✅ Convert response to UserModel
      // UserModel userModel = UserModel.fromJson(userData);
      // _logger.info("Successfully fetched user: ${userModel.name}");

      // return userModel.toEntity();
      UserModel userModel = generateUserWithOneYearData();

      // UserModel userModel = UserModel.fromJson(fakeData);
      return userModel.toEntity();
    } catch (e, stackTrace) {
      _logger.error(
        "Error fetching user data",
        e,
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception('Error fetching user data: $e');
    }
  }
}

UserModel generateUserWithOneYearData() {
  String userId = "123";
  String userName = "Alice";

  List<HabitModel> habits = [
    generateHabit("h1", "Workout"),
    generateHabit("h2", "Reading"),
    generateHabit("h3", "Meditation"),
  ];

  return UserModel(id: userId, name: userName, habits: habits);
}

HabitModel generateHabit(String habitId, String habitName) {
  Map<String, bool> timeline = {};
  DateTime today = DateTime.now();
  Random random = Random();

  for (int i = 0; i < 365; i++) {
    DateTime date = today.subtract(Duration(days: i));
    String dateString = DateFormat('yyyy-MM-dd').format(date);
    // 🔥 Randomly mark days as done (~50% chance)
    bool isDone = random.nextBool();

    timeline[dateString] = isDone;
  }

  return HabitModel(id: habitId, name: habitName, timeline: timeline);
}
