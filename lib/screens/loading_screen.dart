import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mausam/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mausam/services/weather.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with TickerProviderStateMixin{

  @override
  void initState() {
    getLocationData();
    super.initState();
    getLocationData();
  }

  void getLocationData() async{
    await Geolocator.requestPermission();

    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: weatherData,);}
    ));
  }

  @override
  Widget build(BuildContext context) {
    getLocationData();
    return Scaffold(
     body: Center(
        child: SpinKitFoldingCube(
          color: Colors.white,
          size: 200.0,
          controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1000)),
        ),
     ),
    );
  }
}
