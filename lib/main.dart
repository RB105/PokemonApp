import 'package:flutter/material.dart';
import 'package:pokemonn/core/router/router.dart';
import 'package:pokemonn/view/home_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      onGenerateRoute:  RouteGenerator.router.onGenerate,
      initialRoute: '/',
    );
  }
}
