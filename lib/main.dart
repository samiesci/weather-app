import 'package:flutter/material.dart';
import 'package:hava/screens/loadingscreen.dart';
import 'package:hava/screens/mainscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hava Durumu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const mainscreen(),
    );
  }
}
