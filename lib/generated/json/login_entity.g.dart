import 'package:wan/generated/json/base/json_convert_content.dart';
import 'package:wan/ui/auth/data/entity/login_entity.dart';

LoginEntity $LoginEntityFromJson(Map<String, dynamic> json) {
  final LoginEntity loginEntity = LoginEntity();
  final bool? admin = jsonConvert.convert<bool>(json['admin']);
  if (admin != null) {
    loginEntity.admin = admin;
  }
  final List<dynamic>? chapterTops = (json['chapterTops'] as List<dynamic>?)
      ?.map(
          (e) => e)
      .toList();
  if (chapterTops != null) {
    loginEntity.chapterTops = chapterTops;
  }
  final int? coinCount = jsonConvert.convert<int>(json['coinCount']);
  if (coinCount != null) {
    loginEntity.coinCount = coinCount;
  }
  final List<int>? collectIds = (json['collectIds'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<int>(e) as int).toList();
  if (collectIds != null) {
    loginEntity.collectIds = collectIds;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    loginEntity.email = email;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    loginEntity.icon = icon;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    loginEntity.id = id;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    loginEntity.nickname = nickname;
  }
  final String? password = jsonConvert.convert<String>(json['password']);
  if (password != null) {
    loginEntity.password = password;
  }
  final String? publicName = jsonConvert.convert<String>(json['publicName']);
  if (publicName != null) {
    loginEntity.publicName = publicName;
  }
  final String? token = jsonConvert.convert<String>(json['token']);
  if (token != null) {
    loginEntity.token = token;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    loginEntity.type = type;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    loginEntity.username = username;
  }
  return loginEntity;
}

Map<String, dynamic> $LoginEntityToJson(LoginEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['admin'] = entity.admin;
  data['chapterTops'] = entity.chapterTops;
  data['coinCount'] = entity.coinCount;
  data['collectIds'] = entity.collectIds;
  data['email'] = entity.email;
  data['icon'] = entity.icon;
  data['id'] = entity.id;
  data['nickname'] = entity.nickname;
  data['password'] = entity.password;
  data['publicName'] = entity.publicName;
  data['token'] = entity.token;
  data['type'] = entity.type;
  data['username'] = entity.username;
  return data;
}

extension LoginEntityExtension on LoginEntity {
  LoginEntity copyWith({
    bool? admin,
    List<dynamic>? chapterTops,
    int? coinCount,
    List<int>? collectIds,
    String? email,
    String? icon,
    int? id,
    String? nickname,
    String? password,
    String? publicName,
    String? token,
    int? type,
    String? username,
  }) {
    return LoginEntity()
      ..admin = admin ?? this.admin
      ..chapterTops = chapterTops ?? this.chapterTops
      ..coinCount = coinCount ?? this.coinCount
      ..collectIds = collectIds ?? this.collectIds
      ..email = email ?? this.email
      ..icon = icon ?? this.icon
      ..id = id ?? this.id
      ..nickname = nickname ?? this.nickname
      ..password = password ?? this.password
      ..publicName = publicName ?? this.publicName
      ..token = token ?? this.token
      ..type = type ?? this.type
      ..username = username ?? this.username;
  }
}