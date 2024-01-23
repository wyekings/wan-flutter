import 'package:json_annotation/json_annotation.dart';

part 'banner_entity.g.dart';


@JsonSerializable()
class BannerEntity {

  String desc;

  int id;

  String imagePath;

  int isVisible;

  int order;

  String title;

  int type;

  String url;

  BannerEntity(this.desc,this.id,this.imagePath,this.isVisible,this.order,this.title,this.type,this.url,);

  factory BannerEntity.fromJson(Map<String, dynamic> srcJson) => _$BannerEntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BannerEntityToJson(this);
}


