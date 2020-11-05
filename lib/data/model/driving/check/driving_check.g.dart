// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driving_check.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrivingCheck _$DrivingCheckFromJson(Map<String, dynamic> json) {
  return DrivingCheck(
    json['success'] as bool,
    json['result'] == null
        ? null
        : DrivingResult.fromJson(json['result'] as Map<String, dynamic>),
    json['statusCode'] as int,
    json['message'] as String,
  );
}

Map<String, dynamic> _$DrivingCheckToJson(DrivingCheck instance) =>
    <String, dynamic>{
      'success': instance.success,
      'result': instance.result,
      'statusCode': instance.statusCode,
      'message': instance.message,
    };
