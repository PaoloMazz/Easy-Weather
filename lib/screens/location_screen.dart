import 'package:flutter/material.dart';
import 'package:weather/services/weather.dart';
import 'package:weather/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int temperature;
  String weatherIcon;
  String cityName;
  String weatherMessage;
  int humidity;
  var windSpeed;
  String description;
  int sunrise, sunshine;
  DateTime timeSunrise, timeSunshine;
  int oraSunshine, minutiSunshine, oraSunrise, minutiSunrise;
  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Unable to get weather data';
        cityName = '';
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      weatherMessage = weather.getMessage(temperature, condition);
      cityName = weatherData['name'];
      humidity = weatherData['main']['humidity'];
      windSpeed = weatherData['wind']['speed'];
      sunrise = weatherData['sys']['sunrise'];
      sunshine = weatherData['sys']['sunset'];
      description = weatherData['weather'][0]['description'];
      timeSunrise = DateTime.fromMillisecondsSinceEpoch(sunrise * 1000);
      timeSunshine = DateTime.fromMillisecondsSinceEpoch(sunshine * 1000);
      oraSunrise = timeSunrise.hour;
      minutiSunrise = timeSunrise.minute;
      oraSunshine = timeSunshine.hour;
      minutiSunshine = timeSunshine.minute;
      print(description);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.greenAccent[700], Colors.redAccent]),
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "$cityName",
                  style: kNameTextStyle,
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Container(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  '💧 $humidity%\n'
                  '💨 $windSpeed\ m/s\n'
                  '🌅 $oraSunrise:$minutiSunrise\n'
                  '🌇 $oraSunshine:$minutiSunshine',
                  textAlign: TextAlign.left,
                  style: kMessageTextStyle,
                ),
              ),
              Container(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$weatherMessage',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
