import 'package:flutter/material.dart';
import 'package:promilo/screens/description.dart';
import 'package:promilo/screens/home.dart';
import 'package:promilo/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/description': (context) => const DescriptionPage(),
      },
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //useMaterial3: true,
        scaffoldBackgroundColor: Colors.white
      ),
      home: const LoginPage(),
    );
  }
}