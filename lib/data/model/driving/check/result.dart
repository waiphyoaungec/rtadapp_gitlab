import 'package:json_annotation/json_annotation.dart';
part 'result.g.dart';
//car renewable result
@JsonSerializable()
class DrivingResult{
  List<Office> offices;
  DrivingResult(this.offices);
  factory DrivingResult.fromJson(Map<String,dynamic> json) => _$DrivingResultFromJson(json);
}
@JsonSerializable()
class Office{
  int key;
  String name;
  String code;
  Office(this.key,this.name,this.code);
  factory Office.fromJson(Map<String,dynamic> json) => _$OfficeFromJson(json);
}
