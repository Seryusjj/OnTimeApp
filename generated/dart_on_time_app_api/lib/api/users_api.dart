import 'package:jaguar_retrofit/annotations/annotations.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:jaguar_serializer/src/repo/repo.dart';
import 'dart:async';

import 'package:swagger/model/user_role_addition_request.dart';
import 'package:swagger/model/role_response.dart';
import 'package:swagger/model/user_response_response_set.dart';


part 'users_api.jretro.dart';

@GenApiClient()
class UsersApi extends _$UsersApiClient implements ApiClient {
    final Route base;
    final SerializerRepo serializers;

    UsersApi({this.base, this.serializers});

    /// 
    ///
    /// 
    @PostReq(path: "/api/v1/Users/addrole", metadata: {"auth": [ {"type": "apiKey", "name": "Bearer", "keyName": "Authorization", "where": "header" }]})
    Future<RoleResponse> apiV1UsersAddrolePost(
        
        UserRoleAdditionRequest body
    );

    /// 
    ///
    /// 
    @GetReq(path: "/api/v1/Users", metadata: {"auth": [ {"type": "apiKey", "name": "Bearer", "keyName": "Authorization", "where": "header" }]})
    Future<UserResponseResponseSet> apiV1UsersGet(
    );


}
