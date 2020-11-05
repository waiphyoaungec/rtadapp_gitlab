
import 'package:json_annotation/json_annotation.dart';
import 'result.dart';
part 'car_check.g.dart';
@JsonSerializable()
class VehicleLicenceCheck{
  bool success;
  Results result;
  int statusCode;
  String message;
  VehicleLicenceCheck(this.success,this.result,this.statusCode,this.message);
  factory VehicleLicenceCheck.fromJson(Map<String,dynamic> json) => _$VehicleLicenceCheckFromJson(json);

}