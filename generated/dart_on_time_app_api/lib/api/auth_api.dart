import 'package:jaguar_retrofit/annotations/annotations.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:jaguar_serializer/src/repo/repo.dart';
import 'dart:async';



part 'auth_api.jretro.dart';

@GenApiClient()
class AuthApi extends _$AuthApiClient implements ApiClient {
    final Route base;
    final SerializerRepo serializers;

    AuthApi({this.base, this.serializers});

    /// 
    ///
    /// 
    @PostReq(path: "/api/Auth/registeruser")
    Future<void> apiAuthRegisteruserPost(
    );

    /// 
    ///
    /// 
    @PostReq(path: "/api/Auth/signin")
    Future<void> apiAuthSigninPost(
    );

    /// 
    ///
    /// 
    @PostReq(path: "/api/Auth/singout")
    Future<void> apiAuthSingoutPost(
    );


}
