import 'package:jaguar_retrofit/annotations/annotations.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:jaguar_serializer/src/repo/repo.dart';
import 'dart:async';



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
    Future<List<String>> apiValuesGet(
    );

    /// Delete one value
    ///
    /// 
    @DeleteReq(path: "/api/Values/:id")
    Future<void> apiValuesIdDelete(
            @PathParam("id") int id
    );

    /// 
    ///
    /// 
    @GetReq(path: "/api/Values/:id")
    Future<String> apiValuesIdGet(
            @PathParam("id") int id
    );

    /// 
    ///
    /// 
    @PutReq(path: "/api/Values/:id")
    Future<void> apiValuesIdPut(
            @PathParam("id") int id
        ,
        String body
    );

    /// 
    ///
    /// 
    @PostReq(path: "/api/Values")
    Future<void> apiValuesPost(
        
        String body
    );


}
