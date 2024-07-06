import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/coin_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final coinProvider = Provider.of<CoinProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CoinLore'),
      ),
      body: coinProvider.loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: coinProvider.coins.length,
              itemBuilder: (context, index) {
                final coin = coinProvider.coins[index];
                return ListTile(
                  title: Text(coin.name),
                  subtitle: Text('Price: \$${coin.priceUsd}'),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => coinProvider.fetchCoins(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
