import 'package:dio/dio.dart';
import 'package:dio_http2_adapter/dio_http2_adapter.dart';
import 'package:get/get.dart';

import 'store.dart';
import 'types.dart';

const baseUrl = 'https://www.zhihu.com/api/';
final dio = Dio()
  ..options.baseUrl = baseUrl
  ..httpClientAdapter = Http2Adapter(ConnectionManager());

Future request(String path) async {
  final store = Get.find<Store>();
  if (store.cookie.value.isNotEmpty) {
    dio.options.headers['cookie'] = store.cookie.value;
  }
  path = path.replaceAll(baseUrl, '');
  print('request: ${baseUrl + path}');
  final response = await dio.get(baseUrl + path);
  return response.data;
}

Future<Recommend> getRecommend([String url]) async {
  url = url ?? 'v3/feed/topstory/recommend?limit=10&desktop=true';
  final json = await request(url);
  return Recommend.fromJson(json);
}

Future<RootComment> getRootComment(int id, [int page = 0]) async {
  const limit = 20;
  final json = await request(
      'v4/answers/$id/root_comments?order=normal&limit=$limit&offset=${page * limit}&status=open');
  return RootComment.fromJson(json);
}

Future<ChildComment> getChildComment(int id, [int page = 0]) async {
  const limit = 20;
  final json = await request(
      'v4/comments/1087926756/child_comments?limit=$limit&offset=${page * limit}');
  return ChildComment.fromJson(json);
}
