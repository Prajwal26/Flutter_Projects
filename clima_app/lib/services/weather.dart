import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apikey = '688d5b25c19891b1588a37c1fc25c8de';
const openWeatherMap='https://api.openweathermap.org/data/2.5/weather';

double latitude;
double longitude;

class WeatherModel {

  Future<dynamic> getCityWeather(String Cityname) async
  {
    NetworkHelper networkHelper=NetworkHelper('$openWeatherMap?q=$Cityname&appid=$apikey&units=metric');
    var weatherData= await networkHelper.getdata();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async
  {

    Location location = Location();
    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper nethelp = NetworkHelper(
        '$openWeatherMap?lat=$latitude&lon=$longitude&appid=$apikey&units=metric');

    var weatherdata = await nethelp.getdata();
    return weatherdata;

  }



  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
