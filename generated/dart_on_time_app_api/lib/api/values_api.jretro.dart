// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'values_api.dart';

// **************************************************************************
// JaguarHttpGenerator
// **************************************************************************

abstract class _$ValuesApiClient implements ApiClient {
  final String basePath = "";
  Future<List<String>> apiValuesGet() async {
    var req = base.get.path(basePath).path("/api/Values");
    return req.list(convert: serializers.oneFrom);
  }

  Future<void> apiValuesIdDelete(int id) async {
    var req =
        base.delete.path(basePath).path("/api/Values/:id").pathParams("id", id);
    await req.go();
  }

  Future<String> apiValuesIdGet(int id) async {
    var req =
        base.get.path(basePath).path("/api/Values/:id").pathParams("id", id);
    return req.one();
  }

  Future<void> apiValuesIdPut(int id, String body) async {
    var req =
        base.put.path(basePath).path("/api/Values/:id").pathParams("id", id);
    await req.go();
  }

  Future<void> apiValuesPost(String body) async {
    var req = base.post.path(basePath).path("/api/Values");
    await req.go();
  }
}
