import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:clima/services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  void getlocationData() async {
    WeatherModel weatherModel=WeatherModel();
    var weatherdata= await weatherModel.getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        LocationWeather: weatherdata,
      );
    }));
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    print('bcd');
    getlocationData();
  }

  @override
  Widget build(BuildContext context) {
    getlocationData();

    return Scaffold(
      body: Center(
          child: SpinKitDoubleBounce(
        size: 100.0,
        color: Colors.white,
      )),
    );
  }
}
