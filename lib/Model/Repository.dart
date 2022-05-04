import 'UserInformation.dart';

class Repository {
  Repository({
    this.name,
    this.id,
    this.userInformation,
    this.private,
    this.fork,
    this.url,
    this.description,
    this.cloneUrl,
    this.sshUrl,
    this.gitUrl,
    this.homePage,
    this.size,
    this.stargazersCount,
    this.watchersCount,
    this.language,
    this.subscribersCount,
    this.forksCount,
  });

  Repository.fromJson(dynamic json) {
    name = json['name'];
    id = json['id'];
    userInformation = json['UserInformation'] != null
        ? UserInformation.fromJson(json['UserInformation'])
        : null;
    private = json['private'];
    fork = json['fork'];
    url = json['url'];
    description = json['description'];
    cloneUrl = json['cloneUrl'];
    sshUrl = json['sshUrl'];
    gitUrl = json['gitUrl'];
    homePage = json['homePage'];
    size = json['size'];
    stargazersCount = json['stargazers_count'];
    watchersCount = json['watchers_count'];
    language = json['language'];
    subscribersCount = json['subscribers_count'];
    forksCount = json['forks_count'];
  }
  String? name;
  int? id;
  UserInformation? userInformation;
  bool? private;
  bool? fork;
  String? url;
  String? description;
  String? cloneUrl;
  String? sshUrl;
  String? gitUrl;
  String? homePage;
  int? size;
  int? stargazersCount;
  int? watchersCount;
  String? language;
  int? subscribersCount;
  int? forksCount;
  Repository copyWith({
    String? name,
    int? id,
    UserInformation? userInformation,
    bool? private,
    bool? fork,
    String? url,
    String? description,
    String? cloneUrl,
    String? sshUrl,
    String? gitUrl,
    String? homePage,
    int? size,
    int? stargazersCount,
    int? watchersCount,
    String? language,
    int? subscribersCount,
    int? forksCount,
  }) =>
      Repository(
        name: name ?? this.name,
        id: id ?? this.id,
        userInformation: userInformation ?? this.userInformation,
        private: private ?? this.private,
        fork: fork ?? this.fork,
        url: url ?? this.url,
        description: description ?? this.description,
        cloneUrl: cloneUrl ?? this.cloneUrl,
        sshUrl: sshUrl ?? this.sshUrl,
        gitUrl: gitUrl ?? this.gitUrl,
        homePage: homePage ?? this.homePage,
        size: size ?? this.size,
        stargazersCount: stargazersCount ?? this.stargazersCount,
        watchersCount: watchersCount ?? this.watchersCount,
        language: language ?? this.language,
        subscribersCount: subscribersCount ?? this.subscribersCount,
        forksCount: forksCount ?? this.forksCount,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['id'] = id;
    if (userInformation != null) {
      map['UserInformation'] = userInformation?.toJson();
    }
    map['private'] = private;
    map['fork'] = fork;
    map['url'] = url;
    map['description'] = description;
    map['cloneUrl'] = cloneUrl;
    map['sshUrl'] = sshUrl;
    map['gitUrl'] = gitUrl;
    map['homePage'] = homePage;
    map['size'] = size;
    map['stargazers_count'] = stargazersCount;
    map['watchers_count'] = watchersCount;
    map['language'] = language;
    map['subscribers_count'] = subscribersCount;
    map['forks_count'] = forksCount;
    return map;
  }
}
