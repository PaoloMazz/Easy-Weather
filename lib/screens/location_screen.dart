import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  var cityName;
  String weatherMessage;
  int humidity;
  var windSpeed;
  String description;
  int sunrise, sunshine;
  DateTime timeSunrise, timeSunshine;
  int oraSunshine, minutiSunshine, oraSunrise, minutiSunrise;
  var angle;
  var pressure;

  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
//        temperature = 0;
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
      angle = weatherData['wind']['deg'];
      sunrise = weatherData['sys']['sunrise'];
      sunshine = weatherData['sys']['sunset'];
      pressure = weatherData['main']['pressure'];
      description = weatherData['weather'][0]['description'];
      timeSunrise = DateTime.fromMillisecondsSinceEpoch(sunrise * 1000);
      timeSunshine = DateTime.fromMillisecondsSinceEpoch(sunshine * 1000);
      oraSunrise = timeSunrise.hour;
      minutiSunrise = timeSunrise.minute;
      oraSunshine = timeSunshine.hour;
      minutiSunshine = timeSunshine.minute;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blueAccent, Colors.red[900]]),
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 200,
                    child: TextField(
                        onChanged: (value) {
                          cityName = value;
                        },
                        textAlign: TextAlign.center,
                        decoration: kTextFieldInputDecoration,
                        style: GoogleFonts.aBeeZee()),
                  ),
                  Container(
                    width: 10,
                  ),
                  Container(
                    child: GestureDetector(
                      child: Icon(Icons.refresh),
                      onTap: () {
                        setState(() async {
                          var weatherData =
                              await weather.getCityWeather(cityName);
                          updateUI(weatherData);
                        });
                      },
                    ),
                  )
                ],
              ),
              Container(
                height: 10,
              ),
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
                  '🧭 $angle\°\n'
                  '🌅 $oraSunrise:$minutiSunrise\n'
                  '🌇 $oraSunshine:$minutiSunshine\n'
                  '🌡 $pressure hPa',
                  textAlign: TextAlign.left,
                  style: kMessageTextStyleLista,
                ),
              ),
              Container(
                height: 20,
              ),
              Container(
                height: 240,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 50, right: 15),
                    child: Text(
                      weatherMessage,
                      textAlign: TextAlign.right,
                      style: kMessageTextStyleFine,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
