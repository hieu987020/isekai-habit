import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:isekai_habit/domain/providers/habit_provider.dart';
import 'package:provider/provider.dart';
import 'package:isekai_habit/domain/entities/habit_entity.dart';

class HabitScreen extends StatelessWidget {
  const HabitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final habitProvider =
        context.watch<HabitProvider>(); // ✅ Correct way to listen for updates

    if (habitProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final List<HabitEntity> habits = habitProvider.habits;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children:
            habits.map((habit) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// ✅ Habit Title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        habit.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(Icons.settings, size: 20),
                    ],
                  ),

                  const SizedBox(height: 8),

                  /// ✅ Habit Grid (Uses Separate Widget)
                  HabitGrid(habit: habit),

                  const SizedBox(height: 16), // Spacing between grids
                ],
              );
            }).toList(),
      ),
    );
  }
}

class HabitGrid extends StatelessWidget {
  final HabitEntity habit;

  const HabitGrid({super.key, required this.habit});

  @override
  Widget build(BuildContext context) {
    final List<DateTime> allDays = habit.timeline.keys.toList()..sort();
    int weeks = (allDays.length / 7).ceil();

    return Container(
      width: 820,
      height: 200,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ✅ First Column: Labels (Mon, Wed, Fri)
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(7, (index) {
              if (index == 0 || index == 2 || index == 4) {
                return Container(
                  width: 40,
                  height: 11,
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.all(1.2),
                  child: Text(
                    _getWeekdayLabel(index),
                    style: const TextStyle(fontSize: 9),
                  ),
                );
              } else {
                return Container(
                  width: 40,
                  height: 11,
                  margin: const EdgeInsets.all(1.2),
                );
              }
            }),
          ),

          /// ✅ Habit Grid
          Row(
            children: List.generate(weeks, (weekIndex) {
              return Column(
                children: List.generate(7, (dayIndex) {
                  int dayPos = weekIndex * 7 + dayIndex;
                  if (dayPos >= allDays.length) {
                    return const SizedBox.shrink();
                  }
                  DateTime date = allDays[dayPos];
                  return HabitCell(
                    onTap: () {},
                    isCompleted: habit.timeline[date] ?? false,
                    date: date,
                  );
                }),
              );
            }),
          ),
        ],
      ),
    );
  }

  /// ✅ Function to get "Mon", "Wed", "Fri" labels
  String _getWeekdayLabel(int index) {
    switch (index) {
      case 0:
        return "Mon";
      case 2:
        return "Wed";
      case 4:
        return "Fri";
      default:
        return "";
    }
  }
}

class HabitCell extends StatefulWidget {
  final DateTime date;
  final bool isCompleted;
  final VoidCallback onTap;

  const HabitCell({
    super.key,
    required this.onTap,
    required this.isCompleted,
    required this.date,
  });

  @override
  State<HabitCell> createState() => _HabitCellState();
}

class _HabitCellState extends State<HabitCell> {
  bool _isHovered = false;

  Color? _getColor(bool isCompleted) {
    return isCompleted ? Colors.green[500] : Colors.grey[300];
  }

  Color _getBorderColor() {
    if (_isHovered) return Colors.black87; // 🔥 Show border on hover
    return Colors.grey[400]!;
  }

  @override
  Widget build(BuildContext context) {
    // ✅ Format date as "Mon Oct 21 2024"
    String formattedDate = DateFormat("E MMM dd yyyy").format(widget.date);
    String status = widget.isCompleted ? "Done" : "-";
    return Tooltip(
      message: "$status\n$formattedDate", // ✅ Two lines in tooltip
      textStyle: TextStyle(fontSize: 11, color: Colors.grey[500]),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[300] ?? Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter:
            (_) => setState(() => _isHovered = true), // 🔥 Detect hover start
        onExit:
            (_) => setState(() => _isHovered = false), // 🔥 Detect hover end
        child: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            width: 11,
            height: 11,
            margin: EdgeInsets.all(1.2),
            decoration: BoxDecoration(
              color: _getColor(widget.isCompleted),
              border: Border.all(
                color: _getBorderColor(),
                width: _isHovered ? 0.5 : 0.5,
              ), //Border appears on hover
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
      ),
    );
  }
}
