import 'package:jaguar_retrofit/annotations/annotations.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:jaguar_serializer/src/repo/repo.dart';
import 'dart:async';

import 'package:swagger/model/object.dart';


part 'values_api.jretro.dart';

@GenApiClient()
class ValuesApi extends _$ValuesApiClient implements ApiClient {
    final Route base;
    final SerializerRepo serializers;

    ValuesApi({this.base, this.serializers});

    /// 
    ///
    /// 
    @GetReq(path: "/api/Values")
    Future<void> apiValuesGet(
    );

    /// Delete one value
    ///
    /// 
    @DeleteReq(path: "/api/Values/:id")
    Future<void> apiValuesIdDelete(
            @PathParam("id") Object id
    );

    /// 
    ///
    /// 
    @GetReq(path: "/api/Values/:id")
    Future<void> apiValuesIdGet(
            @PathParam("id") Object id
    );

    /// 
    ///
    /// 
    @PutReq(path: "/api/Values/:id")
    Future<void> apiValuesIdPut(
            @PathParam("id") Object id
    );

    /// 
    ///
    /// 
    @PostReq(path: "/api/Values")
    Future<void> apiValuesPost(
    );


}
