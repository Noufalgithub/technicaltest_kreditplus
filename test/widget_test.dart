import 'package:dio/dio.dart';

void main() async {
  Dio dio = Dio();
  var res = await dio.get('https://fakestoreapi.com/products');

  print(res.data);
}
