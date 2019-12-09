// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$UserModelSerializer implements Serializer<UserModel> {
  @override
  Map<String, dynamic> toMap(UserModel model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'email', model.email);
    setMapValue(ret, 'password', model.password);
    return ret;
  }

  @override
  UserModel fromMap(Map map) {
    if (map == null) return null;
    final obj = new UserModel(
        email: map['email'] as String ?? getJserDefault('email'),
        password: map['password'] as String ?? getJserDefault('password'));
    return obj;
  }
}
