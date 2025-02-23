import 'package:isekai_habit/core/services/logger_service.dart';
import 'package:isekai_habit/data/models/habit_model.dart';
import 'package:isekai_habit/data/models/user_model.dart';
import 'package:isekai_habit/domain/entities/user.dart';

class HabitRepository {
  final LoggerService _logger;

  HabitRepository(this._logger);

  /// ✅ Fetch Fake User Data & Convert to Entity
  Future<User> fetchUserData() async {
    _logger.info("Fetching fake user data...");

    await Future.delayed(const Duration(milliseconds: 500)); // Simulate network delay

    // Generate 1-year habit timeline (Done/Not Done randomly)
    Map<DateTime, bool> generateTimeline() {
      DateTime startDate = DateTime.now().subtract(const Duration(days: 365));
      Map<DateTime, bool> timeline = {};
      for (int i = 0; i < 365; i++) {
        DateTime date = startDate.add(Duration(days: i));
        timeline[date] = (date.day % 2 == 0); // Fake logic: Alternate days as done/not done
      }
      return timeline;
    }

    // ✅ Create Fake Habits using `HabitModel`
    List<HabitModel> fakeHabitModels = [
      HabitModel(id: "habit_1", name: "Meditate", timeline: generateTimeline()),
      HabitModel(id: "habit_2", name: "Workout", timeline: generateTimeline()),
      HabitModel(id: "habit_3", name: "Reading", timeline: generateTimeline()),
    ];

    // ✅ Create Fake User Model
    UserModel userModel = UserModel(
      id: "user_123",
      name: "John Doe",
      email: "john@example.com",
      createdAt: DateTime.now().subtract(const Duration(days: 365)),
      habits: fakeHabitModels,
    );

    // ✅ Convert UserModel -> User Entity
    User userEntity = userModel.toEntity();

    _logger.info("Fake user data loaded successfully.");
    return userEntity;
  }
}
