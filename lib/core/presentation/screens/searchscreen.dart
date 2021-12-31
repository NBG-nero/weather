import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weath/core/data/dataProviders/providers/weather_provider.dart';
import 'package:weath/core/presentation/screens/weatherpage.dart';

class CitySearch extends SearchDelegate<String> {
  @override
  Widget buildResults(BuildContext context) {
    return Consumer<WeatherProvider>(
        // stream: null,
        builder: (context, weatherProvider, child) {
      return FutureBuilder(
        future: weatherProvider.getWeather(query,context),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return 
              const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              return 
              const WeatherPage();
            case ConnectionState.active:
              return Container();
            case ConnectionState.none:
              return const Scaffold(
                backgroundColor: Colors.red,
              );
            // default:
            //   if (snapshot.hasError) {
            //     return Container();
            //   } else {
            //     return
            //    const  WeatherPage();
            //     // buildResultSuccess(context);
            //   }
          }
        },
      );
    });
  }

  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              if (query.isEmpty) {
                close(context, '');
              } else {
                query = '';
                showSuggestions(context);
              }
            }),
      ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, ''),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    return Consumer<WeatherProvider>(
        // stream: null,
        builder: (context, weatherProvider, child) {
      return const Scaffold();
    });
  }

  Widget buildResultSuccess(BuildContext context) {
    return const Scaffold();
  }
}
