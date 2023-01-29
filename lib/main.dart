import 'package:flutter/material.dart';
import 'package:pokemonapp/view/home_page.dart';
import 'package:pokemonapp/view/info_page.dart';

void main(List<String> args) {
 runApp(const MyApp()); 
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InfoPage(),
    );
  }
}