// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['userId'] as int,
      json['firstname'] as String?,
      json['lastname'] as String?,
      json['email'] as String?,
      json['token'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'token': instance.token,
      'userId': instance.userId,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
    };
