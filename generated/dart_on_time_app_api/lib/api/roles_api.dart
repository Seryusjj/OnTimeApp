import 'package:jaguar_retrofit/annotations/annotations.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:jaguar_serializer/src/repo/repo.dart';
import 'dart:async';

import 'package:swagger/model/role_registration_request.dart';
import 'package:swagger/model/role_response.dart';
import 'package:swagger/model/string_response_set.dart';


part 'roles_api.jretro.dart';

@GenApiClient()
class RolesApi extends _$RolesApiClient implements ApiClient {
    final Route base;
    final SerializerRepo serializers;

    RolesApi({this.base, this.serializers});

    /// 
    ///
    /// 
    @GetReq(path: "/api/v1/Roles", metadata: {"auth": [ {"type": "apiKey", "name": "Bearer", "keyName": "Authorization", "where": "header" }]})
    Future<StringResponseSet> apiV1RolesGet(
    );

    /// 
    ///
    /// 
    @PostReq(path: "/api/v1/Roles/register", metadata: {"auth": [ {"type": "apiKey", "name": "Bearer", "keyName": "Authorization", "where": "header" }]})
    Future<RoleResponse> apiV1RolesRegisterPost(
        
        RoleRegistrationRequest body
    );


}
