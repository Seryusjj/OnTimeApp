import 'package:jaguar_retrofit/annotations/annotations.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:jaguar_serializer/src/repo/repo.dart';
import 'dart:async';

import 'package:swagger/model/auth_response.dart';
import 'package:swagger/model/user_login_request.dart';
import 'package:swagger/model/user_registration_request.dart';


part 'identity_api.jretro.dart';

@GenApiClient()
class IdentityApi extends _$IdentityApiClient implements ApiClient {
    final Route base;
    final SerializerRepo serializers;

    IdentityApi({this.base, this.serializers});

    /// Creates default admin user, this is added because we do not have a real database where to add this info.  We use an in memeory db so each time the service is restarted, this should be called
    ///
    /// 
    @PostReq(path: "/api/v1/Identity/init", metadata: {"auth": [ {"type": "apiKey", "name": "Bearer", "keyName": "Authorization", "where": "header" }]})
    Future<void> apiV1IdentityInitPost(
    );

    /// Login user in the system
    ///
    /// 
    @PostReq(path: "/api/v1/Identity/login", metadata: {"auth": [ {"type": "apiKey", "name": "Bearer", "keyName": "Authorization", "where": "header" }]})
    Future<AuthResponse> apiV1IdentityLoginPost(
        
        UserLoginRequest body
    );

    /// Register a new user in the system
    ///
    /// 
    @PostReq(path: "/api/v1/Identity/register", metadata: {"auth": [ {"type": "apiKey", "name": "Bearer", "keyName": "Authorization", "where": "header" }]})
    Future<AuthResponse> apiV1IdentityRegisterPost(
        
        UserRegistrationRequest body
    );


}
