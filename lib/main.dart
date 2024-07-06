import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/coin_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CoinProvider()),
      ],
      child: const MaterialApp(
        title: 'CoinLore',
        home: HomeScreen(),
      ),
    );
  }
}
