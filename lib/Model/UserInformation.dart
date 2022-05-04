class UserInformation {
  UserInformation({
    this.login,
    this.id,
    this.avatarUrl,
    this.htmlUrl,
  });

  UserInformation.fromJson(dynamic json) {
    login = json['login'];
    id = json['id'];
    avatarUrl = json['avatarUrl'];
    htmlUrl = json['htmlUrl'];
  }
  String? login;
  int? id;
  String? avatarUrl;
  String? htmlUrl;
  UserInformation copyWith({
    String? login,
    int? id,
    String? avatarUrl,
    String? htmlUrl,
  }) =>
      UserInformation(
        login: login ?? this.login,
        id: id ?? this.id,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        htmlUrl: htmlUrl ?? this.htmlUrl,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['login'] = login;
    map['id'] = id;
    map['avatarUrl'] = avatarUrl;
    map['htmlUrl'] = htmlUrl;
    return map;
  }
}
