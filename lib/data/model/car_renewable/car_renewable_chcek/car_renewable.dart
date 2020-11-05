
import 'package:json_annotation/json_annotation.dart';
import 'result.dart';
part 'car_renewable.g.dart';
@JsonSerializable()
class CarLicenceModel{
  bool success;
  Results result;
  int statusCode;
  String message;
  CarLicenceModel(this.success,this.result,this.statusCode,this.message);
  factory CarLicenceModel.fromJson(Map<String,dynamic> json) => _$CarLicenceModelFromJson(json);

}