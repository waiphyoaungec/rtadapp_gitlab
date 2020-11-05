
import 'package:json_annotation/json_annotation.dart';
import 'result.dart';
part 'driving_check.g.dart';
@JsonSerializable()
class DrivingCheck{
  bool success;
  DrivingResult result;
  int statusCode;
  String message;
  DrivingCheck(this.success,this.result,this.statusCode,this.message);
  factory DrivingCheck.fromJson(Map<String,dynamic> json) => _$DrivingCheckFromJson(json);

}