// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_api.dart';

// **************************************************************************
// JaguarHttpGenerator
// **************************************************************************

abstract class _$AuthApiClient implements ApiClient {
  final String basePath = "";
  Future<void> apiAuthRegisteruserPost() async {
    var req = base.post.path(basePath).path("/api/Auth/registeruser");
    await req.go();
  }

  Future<void> apiAuthSigninPost() async {
    var req = base.post.path(basePath).path("/api/Auth/signin");
    await req.go();
  }

  Future<void> apiAuthSingoutPost() async {
    var req = base.post.path(basePath).path("/api/Auth/singout");
    await req.go();
  }
}
