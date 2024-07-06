import 'package:dio/dio.dart';
import '../models/coin.dart';

class ApiService {
  final String apiUrl = 'https://api.coinlore.net/api/tickers/';
  final Dio _dio = Dio();

  Future<List<Coin>> getTickers() async {
    try {
      final response = await _dio.get(apiUrl);
      List<dynamic> data = response.data['data'];
      return data.map((coin) => Coin.fromJson(coin)).toList();
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
