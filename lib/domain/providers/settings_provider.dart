import 'package:flutter/foundation.dart';

class SettingsProvider with ChangeNotifier, DiagnosticableTreeMixin {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
