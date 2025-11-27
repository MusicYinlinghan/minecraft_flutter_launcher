import 'package:flutter/material.dart';
import 'services/minecraft_service.dart';
import 'services/settings_service.dart';
import 'services/game_launcher_service.dart';
import 'pages/version_management_page.dart';
import 'pages/settings_page.dart';

void main() {
  runApp(const MinecraftLauncherApp());
}

class MinecraftLauncherApp extends StatelessWidget {
  const MinecraftLauncherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minecraft Java Launcher',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LauncherHomePage(),
    );
  }
}

class LauncherHomePage extends StatefulWidget {
  const LauncherHomePage({super.key});

  @override
  State<LauncherHomePage> createState() => _LauncherHomePageState();
}

class _LauncherHomePageState extends State<LauncherHomePage> {
  final MinecraftService minecraftService = MinecraftService();
  final SettingsService settingsService = SettingsService();
  final GameLauncherService gameLauncherService = GameLauncherService(SettingsService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minecraft Java Launcher'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Minecraft Java Launcher',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 启动游戏逻辑
                _launchGame();
              },
              child: const Text('启动游戏'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // 版本管理逻辑
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VersionManagementPage()),
                );
              },
              child: const Text('版本管理'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // 设置逻辑
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
              child: const Text('设置'),
            ),
          ],
        ),
      ),
    );
  }

  void _launchGame() {
    // 这里需要实现启动游戏的逻辑
    // 后续会添加版本选择和启动确认
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('游戏启动功能开发中...')),
    );
  }
}
