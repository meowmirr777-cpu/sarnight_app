import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/cart_item.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const SarNightApp());
}

class SarNightApp extends StatelessWidget {
  const SarNightApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(
        title: 'СарНайт',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.black,
          scaffoldBackgroundColor: const Color(0xFF0A0A1A),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF0A0A1A),
            elevation: 0,
            centerTitle: true,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          fontFamily: 'Inter',
        ),
        home: const SplashScreen(),
      ),
    );
  }
}