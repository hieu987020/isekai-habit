import 'package:dio/dio.dart';
import 'package:isekai_habit/core/services/logger_service.dart';
import 'package:isekai_habit/data/models/user_model.dart';
import 'package:isekai_habit/domain/entities/user_entity.dart';

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
      UserModel userModel = UserModel.fromJson(fakeData);
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

var fakeData = {
  "user_id": "123",
  "user_name": "Alice",
  "habits": [
    {
      "habit_id": "h1",
      "habit_name": "Workout",
      "timeline": {"2024-03-25": true, "2024-03-26": false, "2024-03-27": true},
    },
    {
      "habit_id": "h2",
      "habit_name": "Reading",
      "timeline": {"2024-03-25": true, "2024-03-26": true, "2024-03-27": true},
    },
  ],
};
