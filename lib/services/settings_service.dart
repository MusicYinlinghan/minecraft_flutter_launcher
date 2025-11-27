import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  static const String _gamePathKey = 'game_path';
  static const String _javaPathKey = 'java_path';
  static const String _minMemoryKey = 'min_memory';
  static const String _maxMemoryKey = 'max_memory';
  static const String _usernameKey = 'username';

  Future<SharedPreferences> get _prefs async => await SharedPreferences.getInstance();

  Future<String?> getGamePath() async {
    final prefs = await _prefs;
    return prefs.getString(_gamePathKey);
  }

  Future<void> setGamePath(String path) async {
    final prefs = await _prefs;
    await prefs.setString(_gamePathKey, path);
  }

  Future<String?> getJavaPath() async {
    final prefs = await _prefs;
    return prefs.getString(_javaPathKey);
  }

  Future<void> setJavaPath(String path) async {
    final prefs = await _prefs;
    await prefs.setString(_javaPathKey, path);
  }

  Future<int> getMinMemory() async {
    final prefs = await _prefs;
    return prefs.getInt(_minMemoryKey) ?? 512;
  }

  Future<void> setMinMemory(int memory) async {
    final prefs = await _prefs;
    await prefs.setInt(_minMemoryKey, memory);
  }

  Future<int> getMaxMemory() async {
    final prefs = await _prefs;
    return prefs.getInt(_maxMemoryKey) ?? 2048;
  }

  Future<void> setMaxMemory(int memory) async {
    final prefs = await _prefs;
    await prefs.setInt(_maxMemoryKey, memory);
  }

  Future<String> getUsername() async {
    final prefs = await _prefs;
    return prefs.getString(_usernameKey) ?? 'Player';
  }

  Future<void> setUsername(String username) async {
    final prefs = await _prefs;
    await prefs.setString(_usernameKey, username);
  }
}
