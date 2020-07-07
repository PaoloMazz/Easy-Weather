import 'dart:math';

import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart';

const apiKey = '8589e47f704bc1f3657c95a6d69f9203';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    String citta = "Ostia Antica";
    Location location = Location();
    await location.getCurrentLocation();

//    NetworkHelper networkHelper = NetworkHelper(
//        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?q=$citta&appid=$apiKey&units=metric&lang=it');
    var weatherData = await networkHelper.getData();
    return weatherData;
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

  String getMessage(int temp, int condition) {
    print(condition);
    if (condition > 300 && condition < 600) print("giusto");
    if (temp > 25 && condition == 800) {
      var random = Random();
      int number;
      number = random.nextInt(2) + 1;
      switch (number) {
        case 1:
          return "Situazione attuale: me sto a squaglià! 🥵";
        case 2:
          return "Fa così caldo che il condizionatore mi ha denunciato per sfruttamento";
      }
    }
    if (condition > 300 && condition < 600) {
      var random = Random();
      int number;
      number = random.nextInt(2) + 1;
      switch (number) {
        case 1:
          return "Tanto al massimo fa du’ gocce";
        case 2:
          return "Avevi in programma di uscire?";
      }
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
