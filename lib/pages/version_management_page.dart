import 'package:flutter/material.dart';
import '../services/minecraft_service.dart';
import '../models/minecraft_version.dart';

class VersionManagementPage extends StatefulWidget {
  const VersionManagementPage({super.key});

  @override
  State<VersionManagementPage> createState() => _VersionManagementPageState();
}

class _VersionManagementPageState extends State<VersionManagementPage> {
  final MinecraftService minecraftService = MinecraftService();
  List<MinecraftVersion> versions = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadVersions();
  }

  Future<void> _loadVersions() async {
    setState(() {
      isLoading = true;
    });

    try {
      final manifest = await minecraftService.getVersionManifest();
      setState(() {
        versions = manifest.versions;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load versions: $e')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('版本管理'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadVersions,
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: versions.length,
              itemBuilder: (context, index) {
                final version = versions[index];
                return ListTile(
                  title: Text(version.id),
                  subtitle: Text(version.type),
                  trailing: const Icon(Icons.download),
                  onTap: () {
                    // 下载版本逻辑
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('正在下载版本: ${version.id}')),
                    );
                  },
                );
              },
            ),
    );
  }
}
