import '../services/location.dart';
import '../services/networking.dart';
import 'package:flutter/material.dart';

const apiKey = '29bb1a1b222cabd757585fd0be2e664f';
const openWeatherMapURL = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentPosition();
    NetworkHelper networkHelper = NetworkHelper(
        url:
            '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  AssetImage getImage(int condition) {
    if (condition < 300) {
      return AssetImage('images/first.gif');
    } else if (condition < 400) {
      return AssetImage('images/drizzle.gif');
    } else if (condition < 600) {
      return AssetImage('images/downpour.gif');
    } else if (condition < 700) {
      return AssetImage('images/snow.gif');
    } else if (condition < 800) {
      return AssetImage('images/random.gif');
    } else if (condition == 800) {
      return AssetImage('images/sunny.gif');
    } else if (condition <= 804) {
      return AssetImage('images/cloudy.gif');
    } else {
      return AssetImage('images/location_background.gif');
    }
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
