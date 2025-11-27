class MinecraftVersion {
  final String id;
  final String type;
  final String url;
  final String time;
  final String releaseTime;
  final String sha1;
  final int complianceLevel;

  MinecraftVersion({
    required this.id,
    required this.type,
    required this.url,
    required this.time,
    required this.releaseTime,
    required this.sha1,
    required this.complianceLevel,
  });

  factory MinecraftVersion.fromJson(Map<String, dynamic> json) {
    return MinecraftVersion(
      id: json['id'] as String,
      type: json['type'] as String,
      url: json['url'] as String,
      time: json['time'] as String,
      releaseTime: json['releaseTime'] as String,
      sha1: json['sha1'] as String,
      complianceLevel: json['complianceLevel'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'url': url,
      'time': time,
      'releaseTime': releaseTime,
      'sha1': sha1,
      'complianceLevel': complianceLevel,
    };
  }
}

class MinecraftVersionManifest {
  final String latestRelease;
  final String latestSnapshot;
  final List<MinecraftVersion> versions;

  MinecraftVersionManifest({
    required this.latestRelease,
    required this.latestSnapshot,
    required this.versions,
  });

  factory MinecraftVersionManifest.fromJson(Map<String, dynamic> json) {
    return MinecraftVersionManifest(
      latestRelease: json['latest']['release'] as String,
      latestSnapshot: json['latest']['snapshot'] as String,
      versions: (json['versions'] as List)
          .map((v) => MinecraftVersion.fromJson(v as Map<String, dynamic>))
          .toList(),
    );
  }
}
