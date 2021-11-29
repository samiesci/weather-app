import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:hava/screens/mainscreen.dart';
import 'package:hava/utils/location.dart';
import 'package:hava/utils/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late LocationHelper locationData;
  Future<void> getLocationData() async {
    locationData = LocationHelper();
    await locationData.getCurrentLocation();

    if (locationData.latitude == null || locationData.longitude == null) {
      print("Konum bilgisi alınamadı.");
    } else {
      print("latitude:" + locationData.toString());
      print("longitude:" + locationData.toString());
    }
  }

  void getWeatherData() async {
    await getLocationData();

    WeatherData weatherData = WeatherData(locationData: locationData);
    await weatherData.getCurrentTemperature();
    if (weatherData.currentTemperature == null ||
        weatherData.currentCondition == null) {
      print("API'den sıcaklık ve durum bilgisi sağlanamıyor.");
    }

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return mainscreen(
        weatherData: weatherData,
      );
    }));

    @override
    void initState() {
      super.initState();
      getWeatherData();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue, Colors.orange]),
          ),
          child: const Center(
            child: SpinKitHourGlass(
              color: Colors.white,
              size: 75.0,
              duration: Duration(
                milliseconds: 2400,
              ),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
