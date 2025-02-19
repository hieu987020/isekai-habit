import 'package:flutter/material.dart';

class HabitScreen extends StatelessWidget {
  const HabitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Center the components
          children: const [
            HabitComponent(title: "Work out"),
            SizedBox(height: 12),
            HabitComponent(title: "Reading"),
          ],
        ),
      ),
    );
  }
}

class HabitComponent extends StatefulWidget {
  final String title;

  const HabitComponent({super.key, required this.title});

  @override
  State<HabitComponent> createState() => _HabitComponentState();
}

class _HabitComponentState extends State<HabitComponent> {
  final int daysPerWeek = 7;
  final List<int> titleRows = [0, 2, 4]; // Mon (0), Wed (2), Fri (4)
  final List<String> titleTexts = ["Mon", "Wed", "Fri"];
  late DateTime startDate;
  late DateTime endDate;
  late Map<String, bool> activityData;
  late int totalDays;
  late int fullWeeks;
  late int remainingDays;

  @override
  void initState() {
    super.initState();
    DateTime today = DateTime.now();
    endDate = today;
    DateTime initialStart = DateTime(today.year - 1, today.month, today.day);

    int daysToMonday =
        (initialStart.weekday == DateTime.monday)
            ? 0
            : (initialStart.weekday % 7);
    startDate = initialStart.subtract(Duration(days: daysToMonday));

    totalDays = endDate.difference(startDate).inDays + 1;
    fullWeeks = totalDays ~/ daysPerWeek;
    remainingDays = totalDays % daysPerWeek;
    activityData = {};
  }

  void showLogDialog(DateTime date) {
    showDialog(
      context: context,
      builder: (context) {
        String dateKey = date.toLocal().toString().split(' ')[0];

        return AlertDialog(
          title: const Text("Log Habit"),
          content: Text("Mark habit as complete for $dateKey?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  activityData[dateKey] = true;
                });
                Navigator.pop(context);
              },
              child: const Text("Complete"),
            ),
          ],
        );
      },
    );
  }

  void logToday() {
    showLogDialog(endDate);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width:
          (fullWeeks + (remainingDays > 0 ? 1 : 0)) * 14 +
          80, // Fit all weeks in view
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title row with settings icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.settings, size: 18),
                onPressed: () {}, // Add settings functionality
              ),
            ],
          ),
          const SizedBox(height: 4),

          // Habit tracking grid
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left labels (Only Mon, Wed, Fri)
                Column(
                  children: List.generate(daysPerWeek, (rowIndex) {
                    bool showLabel = titleRows.contains(rowIndex);
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: SizedBox(
                        height: 12,
                        child:
                            showLabel
                                ? Text(
                                  titleTexts[titleRows.indexOf(rowIndex)],
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                                : const SizedBox(),
                      ),
                    );
                  }),
                ),
                const SizedBox(width: 4),
                // Habit tracking grid
                Row(
                  children: [
                    for (int weekIndex = 0; weekIndex < fullWeeks; weekIndex++)
                      Column(
                        children: List.generate(daysPerWeek, (dayIndex) {
                          DateTime currentDate = startDate.add(
                            Duration(
                              days: (weekIndex * daysPerWeek) + dayIndex,
                            ),
                          );
                          String dateKey =
                              currentDate.toLocal().toString().split(' ')[0];
                          bool isToday = currentDate.isAtSameMomentAs(endDate);

                          return GestureDetector(
                            onTap: () => showLogDialog(currentDate),
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Padding(
                                padding: const EdgeInsets.all(1),
                                child: ActivityBox(
                                  isLogged: activityData.containsKey(dateKey),
                                  date: currentDate,
                                  isToday: isToday,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    // Last column (Remaining days)
                    if (remainingDays > 0)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: List.generate(remainingDays, (dayIndex) {
                          DateTime currentDate = startDate.add(
                            Duration(
                              days: (fullWeeks * daysPerWeek) + dayIndex,
                            ),
                          );
                          String dateKey =
                              currentDate.toLocal().toString().split(' ')[0];
                          bool isToday = currentDate.isAtSameMomentAs(endDate);

                          return GestureDetector(
                            onTap: () => showLogDialog(currentDate),
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Padding(
                                padding: const EdgeInsets.all(1),
                                child: ActivityBox(
                                  isLogged: activityData.containsKey(dateKey),
                                  date: currentDate,
                                  isToday: isToday,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // Log Today Button
          Center(
            child: ElevatedButton(
              onPressed: logToday,
              style: ElevatedButton.styleFrom(minimumSize: const Size(100, 30)),
              child: const Text("Log Today", style: TextStyle(fontSize: 12)),
            ),
          ),
        ],
      ),
    );
  }
}

class ActivityBox extends StatelessWidget {
  final bool isLogged;
  final DateTime date;
  final bool isToday;

  const ActivityBox({
    super.key,
    required this.isLogged,
    required this.date,
    required this.isToday,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message:
          "${date.toLocal().toString().split(' ')[0]}${isLogged ? " ✅ Logged" : " ❌ Not Logged"}",
      child: Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(
          color: isLogged ? Colors.green : Colors.grey[300],
          borderRadius: BorderRadius.circular(2),
          border: isToday ? Border.all(color: Colors.black, width: 1.5) : null,
        ),
      ),
    );
  }
}
