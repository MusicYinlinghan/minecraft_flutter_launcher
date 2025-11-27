import 'package:flutter/material.dart';
import '../services/settings_service.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final SettingsService settingsService = SettingsService();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController gamePathController = TextEditingController();
  final TextEditingController javaPathController = TextEditingController();
  final TextEditingController minMemoryController = TextEditingController();
  final TextEditingController maxMemoryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final username = await settingsService.getUsername();
    final gamePath = await settingsService.getGamePath();
    final javaPath = await settingsService.getJavaPath();
    final minMemory = await settingsService.getMinMemory();
    final maxMemory = await settingsService.getMaxMemory();

    setState(() {
      usernameController.text = username;
      gamePathController.text = gamePath ?? '';
      javaPathController.text = javaPath ?? '';
      minMemoryController.text = minMemory.toString();
      maxMemoryController.text = maxMemory.toString();
    });
  }

  Future<void> _saveSettings() async {
    await settingsService.setUsername(usernameController.text);
    await settingsService.setGamePath(gamePathController.text);
    await settingsService.setJavaPath(javaPathController.text);
    await settingsService.setMinMemory(int.parse(minMemoryController.text));
    await settingsService.setMaxMemory(int.parse(maxMemoryController.text));

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('设置已保存')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: '用户名',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: gamePathController,
              decoration: const InputDecoration(
                labelText: '游戏路径',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: javaPathController,
              decoration: const InputDecoration(
                labelText: 'Java路径',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: minMemoryController,
                    decoration: const InputDecoration(
                      labelText: '最小内存 (MB)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: maxMemoryController,
                    decoration: const InputDecoration(
                      labelText: '最大内存 (MB)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _saveSettings,
              child: const Text('保存设置'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
