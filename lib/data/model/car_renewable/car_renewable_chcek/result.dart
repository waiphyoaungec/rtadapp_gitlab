import 'package:json_annotation/json_annotation.dart';
part 'result.g.dart';
//car renewable result
@JsonSerializable()
class Results{
  List<Office> offices;
  List<ApponintmentType> appointmentTypes;
  List<Slot> slots;
  Results(this.offices,this.appointmentTypes,this.slots);
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
@JsonSerializable()
class ApponintmentType{
  int key;
  String name;
  ApponintmentType(this.key,this.name);
  factory ApponintmentType.fromJson(Map<String,dynamic> json) => _$ApponintmentTypeFromJson(json);
}
@JsonSerializable()
class Slot{
  int key;
  String name;
  String code;
  Slot(this.name,this.code);
  factory Slot.fromJson(Map<String,dynamic> json) => _$SlotFromJson(json);
}