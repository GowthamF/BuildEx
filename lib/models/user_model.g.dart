// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      mobile: json['mobile'] as String,
      email: json['email'] as String,
      isActive: json['isActive'] as bool,
      jwtTokens: (json['jwtTokens'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      locked: json['locked'] as bool,
      refreshTokens: (json['refreshTokens'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
      roles: (json['roles'] as List<dynamic>)
          .map((e) => $enumDecode(_$UserRolesEnumMap, e))
          .toList(),
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'mobile': instance.mobile,
      'email': instance.email,
      'roles': instance.roles.map((e) => _$UserRolesEnumMap[e]).toList(),
      'jwtTokens': instance.jwtTokens,
      'refreshTokens': instance.refreshTokens,
      'locked': instance.locked,
      'isActive': instance.isActive,
      'password': instance.password,
    };

const _$UserRolesEnumMap = {
  UserRoles.buyer: 'buyer',
  UserRoles.vehicleOwner: 'vehicleOwner',
  UserRoles.serviceCenter: 'serviceCenter',
};
