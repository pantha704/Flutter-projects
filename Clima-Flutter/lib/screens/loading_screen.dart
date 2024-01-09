import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    WeatherModel weather = WeatherModel();
    await weather.getWeatherData();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LocationScreen(
                  locationWeather: weather,
                )));

    // print(weather.temp_today_in_C);
    // print(weather.temp_today_in_F);

    // Duration delay2sec = Duration(milliseconds: Random().nextInt(1500));   //Artificial delay
    // Future.delayed(delay2sec,() {
    //   Navigator.push(context, MaterialPageRoute(builder: (context)=> LocationScreen(locationWeather: weather.data,)));
    // });

    // for (var day in weather.days_15) {
    //   print(day['datetime']);
    //   print(weather.city);
    //   print(day['description']);
    //   print(day['icon']);
    //   print(day['conditions']);
    //   break;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () async {
          WeatherModel weather = WeatherModel();
          await weather.getWeatherData();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LocationScreen(locationWeather: weather),
            ),
          );
        },
        child: Center(
          child: SpinKitWaveSpinner(
            color: Colors.white,
            size: 100,
          ),
        ),
      ),
    );
  }
}
