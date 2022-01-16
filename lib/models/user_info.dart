class UserInfo {
  String username;

  UserInfo({required this.username});

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      UserInfo(username: json['username']);

  Map<String, dynamic> toJson() => {'username': username};
}
