import 'package:wan/generated/json/base/json_field.dart';
import 'package:wan/generated/json/user_info_entity.g.dart';
import 'dart:convert';
export 'package:wan/generated/json/user_info_entity.g.dart';

@JsonSerializable()
class UserInfoEntity {
	int? coinCount = 0;
	int? level = 0;
	String? nickname = '';
	String? rank = '';
	int? userId = 0;
	String? username = '';

	UserInfoEntity();

	factory UserInfoEntity.fromJson(Map<String, dynamic> json) => $UserInfoEntityFromJson(json);

	Map<String, dynamic> toJson() => $UserInfoEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}