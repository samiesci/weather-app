import 'package:flutter/material.dart';
import 'package:hava/screens/loadingscreen.dart';
import 'package:hava/screens/mainscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
