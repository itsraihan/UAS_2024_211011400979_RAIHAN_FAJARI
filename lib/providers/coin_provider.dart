import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/coin.dart';

class CoinProvider with ChangeNotifier {
  List<Coin> _coins = [];
  bool _loading = false;

  List<Coin> get coins => _coins;
  bool get loading => _loading;

  final ApiService _apiService = ApiService();

  Future<void> fetchCoins() async {
    _loading = true;
    notifyListeners();

    try {
      _coins = await _apiService.getTickers();
    } catch (e) {
      print(e);
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
