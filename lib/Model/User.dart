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
    this.followers,
    this.following,
  });

  User.fromJson(dynamic json) {
    login = json['login'];
    id = json['id'];
    avatarUrl = json['avatar_url'];
    htmlUrl = json['html_url'];
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
  int? followers;//followersCount
  int? following;//followingCount

  User copyWith({
    String? login,
    int? id,
    String? avatarUrl,
    String? htmlUrl,
    String? name,
    String? company,
    String? location,
    String? email,
    int? followers,
    int? following,
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
        followers: followers ?? this.followers,
        following: following ?? this.following,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['login'] = login;
    map['id'] = id;
    map['avatar_url'] = avatarUrl;
    map['html_url'] = htmlUrl;
    map['name'] = name;
    map['company'] = company;
    map['location'] = location;
    map['email'] = email;
    map['followers'] = followers;
    map['following'] = following;
    return map;
  }
}
