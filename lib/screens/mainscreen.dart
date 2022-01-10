import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hava/utils/weather.dart';

class MainScreen extends StatefulWidget {
  WeatherData weatherData;

  MainScreen( @required this.weatherData) ;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int temperature;
  late Icon WeatherDisplayIcon;
  late AssetImage backgroundImage;
  late String city;
  //veriler değiştikçe update olması için

  void updateDisplayInfo(WeatherData weatherData) {
    //setState statik verileri anlık alabilmek için
    setState(() {
      temperature = weatherData.currentTemperature.round();
      city = weatherData.city;
      WeatherDisplayData weatherDisplayData =
          weatherData.getWeatherDisplayData();
      //weatherDisplayDatadan icon ve image çekmek için
      backgroundImage = weatherDisplayData.weatherImage;
      WeatherDisplayIcon = weatherDisplayData.weatherIcon;
    });
  }

  @override
  void initState() {
    super.initState();
    updateDisplayInfo(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: backgroundImage,
            fit: BoxFit.cover,
          ),
        ),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          SizedBox(
            height: 40,
          ),
          Container(
            child: WeatherDisplayIcon,
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: Text(
              '$temperature°',
              style: TextStyle(
                  color: Colors.white, fontSize: 40.0, letterSpacing: -5),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
              child: Text(
            '$city',
            style: TextStyle(
                color: Colors.white, fontSize: 40.0, letterSpacing: -5),
          )),
        ]),
      ),
    );
  }
}
