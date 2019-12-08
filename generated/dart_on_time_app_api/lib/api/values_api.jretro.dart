// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'values_api.dart';

// **************************************************************************
// JaguarHttpGenerator
// **************************************************************************

abstract class _$ValuesApiClient implements ApiClient {
  final String basePath = "";
  Future<void> apiValuesGet() async {
    var req = base.get.path(basePath).path("/api/Values");
    await req.go();
  }

  Future<void> apiValuesIdDelete(Object id) async {
    var req =
        base.delete.path(basePath).path("/api/Values/:id").pathParams("id", id);
    await req.go();
  }

  Future<void> apiValuesIdGet(Object id) async {
    var req =
        base.get.path(basePath).path("/api/Values/:id").pathParams("id", id);
    await req.go();
  }

  Future<void> apiValuesIdPut(Object id) async {
    var req =
        base.put.path(basePath).path("/api/Values/:id").pathParams("id", id);
    await req.go();
  }

  Future<void> apiValuesPost() async {
    var req = base.post.path(basePath).path("/api/Values");
    await req.go();
  }
}
