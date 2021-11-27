import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class mainscreen extends StatefulWidget {
  const mainscreen({Key? key}) : super(key: key);

  @override
  _mainscreenState createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bulutlu2.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              child: Icon(
                FontAwesomeIcons.cloud,
                size: 75.0,
                color: Colors.blueGrey,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                '12°',
                style: TextStyle(
                    color: Colors.white, fontSize: 40.0, letterSpacing: -5),
              ),
            )
          ],
        ),
      ),
    );
  }
}
