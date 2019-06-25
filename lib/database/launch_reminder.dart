class LaunchReminder {
  final int launchId;
  final DateTime net;

  LaunchReminder({this.launchId, this.net});

  Map<String, dynamic> toMap() {
    return {"launch_id": launchId, "net": net.toString()};
  }

  static LaunchReminder fromMap(Map<String, dynamic> map) {
    return LaunchReminder(launchId: map["launch_id"], net: map["net"] == null ? null : DateTime.parse(map["net"]));
  }
}
