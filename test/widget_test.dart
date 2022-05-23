import 'package:dio/dio.dart';
import 'package:technicaltest_kreditplus/app/utils/constants.dart';

void main() async {
  Dio dio = Dio();
  var res = await dio.get(MyConstants.API_URL);

  print(res.data);
}
