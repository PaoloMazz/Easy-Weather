import 'dart:math';

import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart';

const apiKey = '8589e47f704bc1f3657c95a6d69f9203';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric&lang=it');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric&lang=it');
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
    var random = Random();
    int number;
    number = random.nextInt(10) + 1;
    switch (number) {
      case 1:
        return "Chi desidera vedere l'arcobaleno, deve imparare ad amare la pioggia 🌈";
      case 2:
        return "La brezza del mattino ha segreti da dirti. Non tornare a dormire 💤";
      case 3:
        return "L'aria fresca della sera è il respiro del vento che si addormenta placido tra le braccia della notte 🌃";
      case 4:
        return "Ci vogliono sia il sole sia la pioggia per fare un arcobaleno 🌈";
      case 5:
        return "Anche la nebbia ha il suo fascino. Offusca la mente e predispone ai sogni ☁️";
      case 6:
        return "Non hai bisogno di un meteorologo per sapere da che parte tira il vento 🌬️";
      case 7:
        return "Mai potrai smettere di amare la terra con cui hai condiviso il freddo 🌨";
      case 8:
        return "Quando gli alberi chinano il capo, vuol dire che il vento sta passando 🍃";
      case 9:
        return "Il mare di solito non si muove senza l'impulso del vento ⛈️";
      case 10:
        return "Anche un sasso viene consumato da una pioggia troppo forte ☔️";
    }
  }
}
