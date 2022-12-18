// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Task _$$_TaskFromJson(Map<String, dynamic> json) => _$_Task(
      id: json['id'] as String?,
      body: json['body'] as String?,
      isCompleted: json['isCompleted'] as bool,
      category: json['category'] as String,
    );

Map<String, dynamic> _$$_TaskToJson(_$_Task instance) => <String, dynamic>{
      'id': instance.id,
      'body': instance.body,
      'isCompleted': instance.isCompleted,
      'category': instance.category,
    };
