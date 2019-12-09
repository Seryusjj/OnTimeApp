// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_api.dart';

// **************************************************************************
// JaguarHttpGenerator
// **************************************************************************

abstract class _$AuthApiClient implements ApiClient {
  final String basePath = "";
  Future<bool> apiAuthRegisteruserPost(SingUpModel body) async {
    var req = base.post.path(basePath).path("/api/Auth/registeruser");
    return req.one();
  }

  Future<bool> apiAuthSigninPost(UserModel body) async {
    var req = base.post.path(basePath).path("/api/Auth/signin");
    return req.one();
  }

  Future<void> apiAuthSingoutPost() async {
    var req = base.post.path(basePath).path("/api/Auth/singout");
    await req.go();
  }
}
