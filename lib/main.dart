import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Core/misc/routes/route_gen.dart';
import 'core/data/dataProviders/providers/weather_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ 
        ChangeNotifierProvider(
          create: (_) => WeatherProvider(),
        )
      ],
      child: const  WeatherApp(),
    )
    );
}


class WeatherApp extends StatelessWidget {
  const WeatherApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stormy', 
      initialRoute: '?',
      onGenerateRoute: RouteGenerator.generatedRote,
    );
  }
}