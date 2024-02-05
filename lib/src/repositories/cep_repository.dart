import 'package:dio/dio.dart';

class CepRepository {
  late final Dio _http;
  final String _baseUrl = 'https://viacep.com.br/ws/';

  CepRepository([Dio? http]) : _http = http ?? Dio();

  Future<Map> search(String cep) async {
    String endpoint = '$cep/json/';
    final response = await _http.get(_baseUrl + endpoint);
    return response.data;
  }
}
