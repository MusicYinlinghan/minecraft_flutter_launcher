import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/minecraft_version.dart';

class MinecraftService {
  static const String versionManifestUrl = 
      'https://piston-meta.mojang.com/mc/game/version_manifest.json';

  Future<MinecraftVersionManifest> getVersionManifest() async {
    final response = await http.get(Uri.parse(versionManifestUrl));
    
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return MinecraftVersionManifest.fromJson(jsonData);
    } else {
      throw Exception('Failed to load version manifest');
    }
  }

  Future<Map<String, dynamic>> getVersionDetails(String url) async {
    final response = await http.get(Uri.parse(url));
    
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load version details');
    }
  }

  Future<void> downloadFile(String url, String savePath) async {
    final response = await http.get(Uri.parse(url));
    
    if (response.statusCode == 200) {
      // 这里需要实现文件保存逻辑
      // 后续会使用path_provider和dart:io来实现
    } else {
      throw Exception('Failed to download file');
    }
  }
}
