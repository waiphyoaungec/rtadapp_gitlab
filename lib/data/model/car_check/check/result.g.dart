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
  );
}

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'offices': instance.offices,
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
