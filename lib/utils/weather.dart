import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'location.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart';
import 'dart:core';

const apiKey = "------------------";

class WeatherDisplayData {
  Icon weatherIcon;
  AssetImage weatherImage;

  WeatherDisplayData({required this.weatherIcon, required this.weatherImage});
}

class WeatherData {
  WeatherData({required this.locationData});

  LocationHelper locationData;

  late double currentTemperature;
  late int currentCondition;
  late String city;

  Future<void> getCurrentTemperature() async {
    String url =
        'http://api.openweathermap.org/data/2.5/weather?lat=${locationData.latitude}&lon=${locationData.longitude}&appid=${apiKey}&units=metric';
    var response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      var currentWeather = convert.jsonDecode(data);

      try {
        currentTemperature = currentWeather['main']['temp'] as double;
        currentCondition = currentWeather['weather'][0]['id'] as int;
        city = currentWeather['name'];
      } catch (e) {
        print(e);
      }
    } else {
      print("API den değer gelmiyor!");
    }
  }

  WeatherDisplayData getWeatherDisplayData() {
    if (currentCondition < 600) {
      //bulutlu hava (condition)
      return WeatherDisplayData(
          weatherIcon:
              Icon(FontAwesomeIcons.cloud, size: 75.0, color: Colors.white),
          weatherImage: AssetImage('assets/bulutlu2.png'));
    }
    //hava iyi
    //gece ve gündüzü saatle kontrol
    else {
      var now = new DateTime.now();
      if (now.hour >= 18) {
        return WeatherDisplayData(
            weatherIcon:
                Icon(FontAwesomeIcons.moon, size: 75.0, color: Colors.white),
            weatherImage: AssetImage('assets/gece.png'));
      } else {
        return WeatherDisplayData(
            weatherIcon:
                Icon(FontAwesomeIcons.sun, size: 75.0, color: Colors.white),
            weatherImage: AssetImage('assets/gunes.png'));
      }
    }
  }
}
