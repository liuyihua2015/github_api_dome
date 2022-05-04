import 'dart:convert';

class User {
  User({
    this.login,
    this.id,
    this.avatarUrl,
    this.htmlUrl,
    this.name,
    this.company,
    this.location,
    this.email,
  });

  User.fromJson(dynamic json) {
    login = json['login'];
    id = json['id'];
    avatarUrl = json['avatarUrl'];
    htmlUrl = json['htmlUrl'];
    name = json['name'];
    company = json['company'];
    location = json['location'];
    email = json['email'];
  }
  String? login;
  int? id;
  String? avatarUrl;
  String? htmlUrl;
  String? name;
  String? company;
  String? location;
  String? email;
  int? followersCount;
  int? followingCount;

  User copyWith({
    String? login,
    int? id,
    String? avatarUrl,
    String? htmlUrl,
    String? name,
    String? company,
    String? location,
    String? email,
  }) =>
      User(
        login: login ?? this.login,
        id: id ?? this.id,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        htmlUrl: htmlUrl ?? this.htmlUrl,
        name: name ?? this.name,
        company: company ?? this.company,
        location: location ?? this.location,
        email: email ?? this.email,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['login'] = login;
    map['id'] = id;
    map['avatarUrl'] = avatarUrl;
    map['htmlUrl'] = htmlUrl;
    map['name'] = name;
    map['company'] = company;
    map['location'] = location;
    map['email'] = email;
    return map;
  }
}