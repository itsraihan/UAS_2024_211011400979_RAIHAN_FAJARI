class Coin {
  final String name;
  final String priceUsd;

  Coin({required this.name, required this.priceUsd});

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      name: json['name'],
      priceUsd: json['price_usd'],
    );
  }
}
