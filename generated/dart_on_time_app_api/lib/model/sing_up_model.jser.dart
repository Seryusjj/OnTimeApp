// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sing_up_model.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$SingUpModelSerializer implements Serializer<SingUpModel> {
  @override
  Map<String, dynamic> toMap(SingUpModel model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'email', model.email);
    setMapValue(ret, 'password', model.password);
    setMapValue(ret, 'repeatPassword', model.repeatPassword);
    return ret;
  }

  @override
  SingUpModel fromMap(Map map) {
    if (map == null) return null;
    final obj = new SingUpModel(
        email: map['email'] as String ?? getJserDefault('email'),
        password: map['password'] as String ?? getJserDefault('password'),
        repeatPassword: map['repeatPassword'] as String ??
            getJserDefault('repeatPassword'));
    return obj;
  }
}
