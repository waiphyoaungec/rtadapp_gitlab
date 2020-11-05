// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Results _$ResultsFromJson(Map<String, dynamic> json) {
  return Results(
    (json['offices'] as List)
        ?.map((e) =>
            e == null ? null : Office.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['appointmentTypes'] as List)
        ?.map((e) => e == null
            ? null
            : ApponintmentType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['slots'] as List)
        ?.map(
            (e) => e == null ? null : Slot.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'offices': instance.offices,
      'appointmentTypes': instance.appointmentTypes,
      'slots': instance.slots,
    };

Office _$OfficeFromJson(Map<String, dynamic> json) {
  return Office(
    json['key'] as int,
    json['name'] as String,
    json['code'] as String,
  );
}

Map<String, dynamic> _$OfficeToJson(Office instance) => <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'code': instance.code,
    };

ApponintmentType _$ApponintmentTypeFromJson(Map<String, dynamic> json) {
  return ApponintmentType(
    json['key'] as int,
    json['name'] as String,
  );
}

Map<String, dynamic> _$ApponintmentTypeToJson(ApponintmentType instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
    };

Slot _$SlotFromJson(Map<String, dynamic> json) {
  return Slot(
    json['name'] as String,
    json['code'] as String,
  )..key = json['key'] as int;
}

Map<String, dynamic> _$SlotToJson(Slot instance) => <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'code': instance.code,
    };
