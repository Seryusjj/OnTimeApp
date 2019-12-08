import 'package:jaguar_retrofit/annotations/annotations.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:jaguar_serializer/src/repo/repo.dart';
import 'dart:async';

import 'package:swagger/model/sing_up_model.dart';
import 'package:swagger/model/user_model.dart';


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
    Future<bool> apiAuthRegisteruserPost(
        
        SingUpModel body
    );

    /// 
    ///
    /// 
    @PostReq(path: "/api/Auth/signin")
    Future<bool> apiAuthSigninPost(
        
        UserModel body
    );

    /// 
    ///
    /// 
    @PostReq(path: "/api/Auth/singout")
    Future<void> apiAuthSingoutPost(
    );


}
