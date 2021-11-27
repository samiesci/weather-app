import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hava/utils/weatherdata.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'location.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'location.dart';

const apiKey = "4228c0e1bcb0a695572d6ef0b21809e8";

class WeatherDisplayData {
  Icon weatherIcon;
  AssetImage weatherImage;

  WeatherDisplayData({required this.weatherIcon, required this.weatherImage});
}

class WeatherData {
  WeatherData({required this.locationData});

  LocationHelper locationData;
  double currentTemperature;
  int currentCondition;
  String city;

  Future<void> getCurrentTemperature() async {
    var response = await http.get(
        "https://api.openweathermap.org/data/2.5/weather?lat=39.84528&lon=33.50639&appid=4228c0e1bcb0a695572d6ef0b21809e8&units=metric");

    if (response.statusCode == 200) {
      String data = response.body;
      var currentWeather = jsonDecode(data);

      try {
        currentTemperature = currentWeather['main']['temp'];
        currentCondition = currentWeather['weather'][0]['id'];
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
      //hava bulutlu
      return WeatherDisplayData(
          weatherIcon:
              Icon(FontAwesomeIcons.cloud, size: 75.0, color: Colors.white),
          weatherImage: AssetImage('assets/bulutlu.png'));
    } else {
      //hava iyi
      //gece gündüz kontrolü
      var now = new DateTime.now();
      if (now.hour >= 19) {
        return WeatherDisplayData(
            weatherIcon:
                Icon(FontAwesomeIcons.moon, size: 75.0, color: Colors.white),
            weatherImage: AssetImage('assets/gece.png'));
      } else {
        return WeatherDisplayData(
            weatherIcon:
                Icon(FontAwesomeIcons.sun, size: 75.0, color: Colors.white),
            weatherImage: AssetImage('assets/gunesli.png'));
      }
    }
  }
}
