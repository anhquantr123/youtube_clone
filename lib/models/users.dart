import 'dart:convert';

class UserData {
  final String userName;
  final String name;
  final String email;
  final String profilePic;
  final List<String> subscriptions;
  final int videos;
  final String userId;
  final String descriptions;
  final String type;

  UserData({
    required this.userId,
    required this.name,
    required this.userName,
    required this.email,
    required this.profilePic,
    required this.subscriptions,
    required this.videos,
    required this.descriptions,
    required this.type,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "userId": userId,
      "username": userName,
      "name": email,
      "email": email,
      "profilePic": profilePic,
      "subscriptions": subscriptions,
      "videos": videos,
      "descriptions": descriptions,
      "type": type
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
        userId: map["userId"],
        name: map["name"],
        userName: map["userName"],
        email: map["email"],
        profilePic: map["profilePic"],
        subscriptions: List<String>.from(map["subscriptions"] ?? []),
        videos: map["video"] as int,
        descriptions: map["descriptions"],
        type: map["type"]);
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source));
}
