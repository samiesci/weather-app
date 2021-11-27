import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'location.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

const apiKey = "4228c0e1bcb0a695572d6ef0b21809e8";


class weatherdata {
  weatherdata({required this.locationData});
  LocationHelper locationData;

  double currentTemperature;
  int currentCondition;
  

  Future<void> getCurrentTemperature() async {
    var response = 
        await http.get('http://api.openweathermap.org/data/2.5/weather?lat=${locationData.latitude}&lon=${locationData.longitude}&appid=${apiKey}&unit=metric');
        if (response.statusCode == 200) {
      String data = response.body;
      var currentWeather = convert.jsonEncode(data);

      try{
        currentTemperature = currentWeather['main']['temp'];
      }
    }
  }
}
