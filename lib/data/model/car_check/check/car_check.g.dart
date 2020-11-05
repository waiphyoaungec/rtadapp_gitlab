// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_check.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleLicenceCheck _$VehicleLicenceCheckFromJson(Map<String, dynamic> json) {
  return VehicleLicenceCheck(
    json['success'] as bool,
    json['result'] == null
        ? null
        : Results.fromJson(json['result'] as Map<String, dynamic>),
    json['statusCode'] as int,
    json['message'] as String,
  );
}

Map<String, dynamic> _$VehicleLicenceCheckToJson(
        VehicleLicenceCheck instance) =>
    <String, dynamic>{
      'success': instance.success,
      'result': instance.result,
      'statusCode': instance.statusCode,
      'message': instance.message,
    };
