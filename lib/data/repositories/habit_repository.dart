import 'package:dio/dio.dart';
import 'package:isekai_habit/core/services/logger_service.dart';
import 'package:isekai_habit/data/models/user_model.dart';
import 'package:isekai_habit/domain/entities/user_entity.dart';

// class HabitRepository {
//   final LoggerService _logger;

//   HabitRepository(this._logger);

//   /// ✅ Fetch Fake User Data & Convert to Entity
//   Future<User> fetchUserData() async {
//     _logger.info("Fetching fake user data...");

//     await Future.delayed(const Duration(milliseconds: 500)); // Simulate network delay

//     // Generate 1-year habit timeline (Done/Not Done randomly)
//     Map<DateTime, bool> generateTimeline() {
//       DateTime startDate = DateTime.now().subtract(const Duration(days: 365));
//       Map<DateTime, bool> timeline = {};
//       for (int i = 0; i < 365; i++) {
//         DateTime date = startDate.add(Duration(days: i));
//         timeline[date] = (date.day % 2 == 0); // Fake logic: Alternate days as done/not done
//       }
//       return timeline;
//     }

//     // ✅ Create Fake Habits using `HabitModel`
//     List<HabitModel> fakeHabitModels = [
//       HabitModel(id: "habit_1", name: "Meditate", timeline: generateTimeline()),
//       HabitModel(id: "habit_2", name: "Workout", timeline: generateTimeline()),
//       HabitModel(id: "habit_3", name: "Reading", timeline: generateTimeline()),
//     ];

//     // ✅ Create Fake User Model
//     UserModel userModel = UserModel(
//       id: "user_123",
//       name: "John Doe",
//       email: "john@example.com",
//       createdAt: DateTime.now().subtract(const Duration(days: 365)),
//       habits: fakeHabitModels,
//     );

//     // ✅ Convert UserModel -> User Entity
//     User userEntity = userModel.toEntity();

//     _logger.info("Fake user data loaded successfully.");
//     return userEntity;
//   }
// }

class HabitRepository {
  final LoggerService _logger;
  final Dio _dio;

  HabitRepository(this._logger, this._dio);

  /// Fetch user data and return UserEntity
  Future<UserEntity> fetchUser() async {
    try {
      final String endpoint = "/habits"; // Only the endpoint
      final String fullUrl = "${_dio.options.baseUrl}$endpoint"; // Full URL

      _logger.info("Fetching user data from: $fullUrl"); // ✅ Log API URL

      // ✅ Step 1: Fetch user data (Includes habit data)
      final response = await _dio.get(endpoint);

      if (response.statusCode != 200) {
        _logger.error(
          "Failed to fetch user data: ${response.statusCode}",
          Exception('HTTP error'),
        );
        throw Exception('Failed to fetch user data');
      }

      // ✅ Extract user data
      final Map<String, dynamic> userData = response.data;

      // ✅ Convert response to UserModel
      UserModel userModel = UserModel.fromJson(userData);
      _logger.info("Successfully fetched user: ${userModel.name}");

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
