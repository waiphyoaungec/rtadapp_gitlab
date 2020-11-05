import 'package:json_annotation/json_annotation.dart';
part 'result.g.dart';
//car renewable result
@JsonSerializable()
class Results{
  List<Office> offices;
  Results(this.offices);
  factory Results.fromJson(Map<String,dynamic> json) => _$ResultsFromJson(json);
}
@JsonSerializable()
class Office{
  int key;
  String name;
  String code;
  Office(this.key,this.name,this.code);
  factory Office.fromJson(Map<String,dynamic> json) => _$OfficeFromJson(json);
}
