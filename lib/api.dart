import 'package:dio/dio.dart';
import 'package:dio_http2_adapter/dio_http2_adapter.dart';

import 'types.dart';

const baseUrl = 'https://www.zhihu.com/api/v3/';
final dio = Dio()
  ..options.baseUrl = baseUrl
  ..options.headers = {
    'cookie':
        '_zap=92bd848c-9e28-4231-af35-5a2932179ab5; d_c0="ANAWFwMldxKPTprxH9899aYvepOnrrPUB-Q=|1610013302"; _xsrf=071de3f1-bc73-47a6-9af6-01849ac7c989; KLBRSID=d6f775bb0765885473b0cba3a5fa9c12|1612592268|1612591762; captcha_session_v2="2|1:0|10:1612591763|18:captcha_session_v2|28:YzBmMzU0cWRzcG9zZGtsMWMxZWc=|a90a6bc2bc67c8a1760114123a0a4e0e10134b4058170fa99b089573ffa6a28c"; SESSIONID=6LbtP7tl89LZ4iJB3Igrn5d7PC6uN3n7ncCamTq51Qp; JOID=UlkWB0wq2NUNUF_ycC5-ThFEymlhHZawegdphBsV4JtQZzG5ML3vz2lWXPd0KvJZ8PuCaMC6C6caVSoUfHdpEGE=; osd=VlgXCkwu2dQAUFvzcSN-ShBFx2llHJe9egNohRYV5JpRajG9Mbziz21XXfp0LvNY_fuGacG3C6MbVCcUeHZoHWE=; captcha_ticket_v2="2|1:0|10:1612591772|17:captcha_ticket_v2|244:eyJhcHBpZCI6IjIwMTIwMzEzMTQiLCJyZXQiOjAsInRpY2tldCI6InQwM1pnUkZPQWFtZllwWlBFUHRqMFBBbmFzc1d5RFlabzc3SG14NE5UZU9MR1UtUUpIZURoQUNhWXU4SVBHRVBlTjZwb3dXRWVmN3Nqd3dIZVpTY05ORWtKRG8yNGVoYTVVeUYxalU0a2hsQ1NiOFNzcEJRVHZCY2cqKiIsInJhbmRzdHIiOiJAY1ZOIn0=|bc7c80c109fba9d1c8d0b7b828b9ded6a869180fff6cc429e19c83d85cf14626"; z_c0="2|1:0|10:1612591772|4:z_c0|92:Mi4xQVpzMEFBQUFBQUFBMEJZWEF5VjNFaVlBQUFCZ0FsVk5uSUFMWVFERkdkckFwVXB6eG5ES2VaVC1IYVBVeGxGVmRR|0247202ae3a1f10afdf4279ac732577cc1158328fb3bcf7644b59678915589a5'
  }
  ..httpClientAdapter = Http2Adapter(ConnectionManager());

Future request(String path) async {
  path = path.replaceAll(baseUrl, '');
  print('request: ${baseUrl + path}');
  final response = await dio.get(baseUrl + path);
  return response.data;
}

Future<Recommend> getRecommend([String url]) async {
  url = url ?? 'feed/topstory/recommend?limit=10&desktop=true';
  final json = await request(url);
  return Recommend.fromJson(json);
}
