import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'location.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

const apiKey = "4228c0e1bcb0a695572d6ef0b21809e8";

class WeatherData {
  WeatherData({required this.locationData});
  LocationHelper locationData;

  double currentTemperature;
  int currentCondition;
  int city;

  Future<void> getCurrentTemperature() async {
    var response = await get(
        "http://api.openweathermap.org/data/2.5/weather?lat=${locationData.latitude}&lon=${locationData.longitude}&appid=${apiKey}&units=metric");
    if (response.statusCode == 200) {
      String data = response.body;
      var currentWeather = convert.jsonDecode(data);

      try {
        currentTemperature = currentWeather['main']['temp'] as double;
        currentCondition = currentWeather['weather'][0]['id'] as int;
        city = currentWeather['name'] as int;
      } catch (e) {
        print(e);
      }
    } else {
      print("API den değer gelmiyor!");
    }
  }
}
