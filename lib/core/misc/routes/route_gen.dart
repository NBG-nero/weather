import 'package:flutter/material.dart';
import 'package:weath/core/presentation/screens/home_screen.dart';
import 'package:weath/core/presentation/screens/weatherpage.dart';

class RouteGenerator {
  static Route<dynamic> generatedRote(RouteSettings settings) {
    switch (settings.name) {
      case '?':
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case 'w':
        return MaterialPageRoute(builder: (_) => const WeatherPage());


        // return _errorRoute();

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        backgroundColor: Colors.red,
        // appBar: AppBar(
        //   title: Text('Error'),
        // ),
        body:  Center(
          child:  Text(
            "ERROR",
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
        ),
      );
    });
  }
}
