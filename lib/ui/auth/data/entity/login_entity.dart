import 'package:wan/generated/json/base/json_field.dart';
import 'package:wan/generated/json/login_entity.g.dart';
import 'dart:convert';
export 'package:wan/generated/json/login_entity.g.dart';

@JsonSerializable()
class LoginEntity {
	bool? admin = false;
	List<dynamic>? chapterTops = [];
	int? coinCount = 0;
	List<int>? collectIds = [];
	String? email = '';
	String? icon = '';
	int? id = 0;
	String? nickname = '';
	String? password = '';
	String? publicName = '';
	String? token = '';
	int? type = 0;
	String? username = '';

	LoginEntity();

	factory LoginEntity.fromJson(Map<String, dynamic> json) => $LoginEntityFromJson(json);

	Map<String, dynamic> toJson() => $LoginEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}