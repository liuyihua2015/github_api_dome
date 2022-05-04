// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      json['id'] as String?,
      json['type'] as String?,
      json['repo'] == null ? null : Repository.fromJson(json['repo']),
      json['actor'] == null ? null : User.fromJson(json['actor']),
      json['payload'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'repo': instance.repo,
      'actor': instance.actor,
      'payload': instance.payload,
    };
