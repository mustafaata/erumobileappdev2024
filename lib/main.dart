import 'package:flutter/material.dart';
import 'package:madproject/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

//Uygulamanın iyi çalıştığı ve ilk yönlendirmenin yapıldığı kısım.

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teknoloji Haberleri',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
