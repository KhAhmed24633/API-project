import 'package:api_project/Views/api.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RandomApi(),
    );
  }
}
