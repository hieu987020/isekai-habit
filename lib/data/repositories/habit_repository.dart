import 'package:isekai_habit/core/services/logger_service.dart';
import 'package:isekai_habit/domain/entities/user.dart';
import 'package:isekai_habit/data/models/user_model.dart';

class HabitRepository {
  final LoggerService _logger;

  HabitRepository(this._logger);

  Future<User> fetchUserData() async {
    _logger.info("Fetching user habit data...");

    await Future.delayed(const Duration(seconds: 2)); // Simulate API delay

    // Fake UserModel data
    UserModel userModel = UserModel(
      id: "user_123",
      name: "John Doe",
      email: "john@example.com",
      createdAt: DateTime.now().subtract(const Duration(days: 365)),
      habits: [],
    );

    _logger.info("User data loaded successfully.");
    
    // ✅ Convert UserModel → User
    return userModel.toEntity();
  }
}
