import 'package:wan/generated/json/base/json_field.dart';
import 'package:wan/generated/json/banner_entity.g.dart';
import 'dart:convert';
export 'package:wan/generated/json/banner_entity.g.dart';

@JsonSerializable()
class BannerEntity {
	String? desc = '';
	int? id = 0;
	String? imagePath = '';
	int? isVisible = 0;
	int? order = 0;
	String? title = '';
	int? type = 0;
	String? url = '';

	BannerEntity();

	factory BannerEntity.fromJson(Map<String, dynamic> json) => $BannerEntityFromJson(json);

	Map<String, dynamic> toJson() => $BannerEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}