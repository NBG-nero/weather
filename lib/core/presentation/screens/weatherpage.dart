// import 'dart:html';

// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison, sized_box_for_whitespace

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weath/core/data/dataProviders/providers/weather_provider.dart';
// import 'package:weath/core/presentation/widgets/imagelist.dart';
import 'package:weath/core/presentation/widgets/loading.dart';
// import 'package:weath/core/presentation/widgets/progressindicator.dart';
import 'package:weath/core/presentation/widgets/weathericons.dart';
// import 'package:carousel_slider/carousel_slider.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // int currentIndex = 0;
  final controller = PageController(viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Consumer<WeatherProvider>(
        // stream: null,
        builder: (context, weatherProvider, child) {
      weatherProvider.randomImage();
      if (weatherProvider.loading) {
        return const LoadingWidget();
      } else {
        return Scaffold(
            body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: weatherProvider.selectRandomImage(weatherProvider.images),

              //  ( weatherProvider.major!.main!.temp! >=272.39 ?
              //   AssetImage('assets/images/bg7.jpg') : AssetImage('assets/images/bg5.jpg')
              // ),

              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.all(10.0),
          constraints: const BoxConstraints.expand(),
          child: Container(
            color: Colors.transparent,
            child: ListView(
              children: [
                SizedBox(
                  height: size.height * 0.010,
                ),
                Row(
                  children: [
                    SizedBox(width: size.width * 0.010),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '?'),
                      child: Icon(Icons.search, color: Colors.white),
                    ),
                    SizedBox(
                      width: size.width * 0.80,
                    ),
                    Icon(Icons.menu, color: Colors.white)
                  ],
                ),
                SizedBox(height: size.height * 0.060),
                Row(
                  children: [
                    SizedBox(width: size.width * 0.010),
                    SmoothPageIndicator(
                      controller: controller,
                      count: 4,
                      effect: const SlideEffect(
                        spacing: 10.0,
                        radius: 5.6,
                        dotWidth: 8.0,
                        dotHeight: 8.0,
                        dotColor: Colors.white38,
                        paintStyle: PaintingStyle.stroke,
                        strokeWidth: 1,
                        activeDotColor: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.050,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.010,
                    ),
                    // nm == null
                    // ? Text('')
                    // :
                    Text(
                      // '$nm',
                      weatherProvider.major!.name!.toUpperCase(),
                      style: const TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.010,
                ),
                Row(
                  children: [
                    SizedBox(width: size.width * 0.010),
                    Text(
                      weatherProvider.major!.weather![0].main!,
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.190,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.010,
                    ),
                    Text(
                      (weatherProvider.major!.main!.temp - 273.15)
                              .truncate()
                              .toString() +
                          '°'
                      //  alt + numeric 0176
                      ,
                      style: const TextStyle(color: Colors.white, fontSize: 90),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.015),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.010,
                      ),
                      WeatherIcon().getweathercon(
                          weatherProvider.major!.weather![0].main!),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        weatherProvider.major!.weather![0].description!,
                        style: const TextStyle(
                            color: Colors.white70, fontSize: 23),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Divider(
                  color: Colors.white60,
                  thickness: 3,
                ),
                SizedBox(height: 35),
                Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.010,
                    ),

                    // 00000000000000000000000000000000000000000000WIND
                    Column(
                      children: [
                        Text(
                          'Wind',
                          style: const TextStyle(
                              color: Colors.white70, fontSize: 18),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          (weatherProvider.major!.wind!.speed! * 3.6)
                              .truncate()
                              .toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 25),
                        ),
                        Text(
                          'km/h',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            //  color: Colors.blue,
                            height: 5,
                            width: 70,
                            child: LinearProgressIndicator(
                                backgroundColor: Colors.grey,
                                //  color: Colors.green,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  (Colors.red),

                                  // weatherProvider.getProgressColor(
                                  //   weatherProvider.getProgress(
                                  //     weatherProvider.major!.wind!.speed!
                                  //         .truncate(),
                                  //   ),
                                  // ),
                                ),
                                minHeight: 2.5,
                                value: weatherProvider.getProgress(
                                    (weatherProvider.major!.wind!.speed! * 3.6)
                                        .truncate())
                                //  0.13

                                ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: size.width * 0.1550,
                    ),
                    // 000000000000000000000000000000000000005PRESSURE
                    Column(
                      children: [
                        Text(
                          'Pressure',
                          style: const TextStyle(
                              color: Colors.white70, fontSize: 18),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          (weatherProvider.major!.main!.pressure! / 100)
                              .toStringAsFixed(1)
                              // .truncate()

                              .toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 25),
                        ),
                        Text(
                          '%',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            //  color: Colors.blue,
                            height: 5,
                            width: 70,
                            child: LinearProgressIndicator(
                                backgroundColor: Colors.grey,
                                //  color: Colors.green,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  (Colors.green),

                                  // weatherProvider.getProgressColor(
                                  //   weatherProvider.getProgress(
                                  //     weatherProvider.major!.wind!.speed!
                                  //         .truncate(),
                                  //   ),
                                  // ),
                                ),
                                minHeight: 2.5,
                                value: weatherProvider.getProgress(
                                    (weatherProvider.major!.main!.pressure! /
                                            100)
                                        .truncate())
                                //  0.13

                                ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: size.width * 0.155,
                    ),
                    // 00000000000000000000000000000000HUMIDITY
                    Column(
                      children: [
                        Text(
                          'Humidity',
                          style: const TextStyle(
                              color: Colors.white70, fontSize: 18),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          (weatherProvider.major!.main!.humidity!)
                              .truncate()
                              .toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 25),
                        ),
                        Text(
                          '%',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            //  color: Colors.blue,
                            height: 5,
                            width: 70,
                            child: LinearProgressIndicator(
                                backgroundColor: Colors.grey,
                                //  color: Colors.green,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  (Colors.blue),

                                  // weatherProvider.getProgressColor(
                                  //   weatherProvider.getProgress(
                                  //     weatherProvider.major!.wind!.speed!
                                  //         .truncate(),
                                  //   ),
                                  // ),
                                ),
                                minHeight: 2.5,
                                value: weatherProvider.getProgress(
                                    weatherProvider.major!.main!.humidity!
                                        .truncate())
                                //  0.13

                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
      }
    });
  }
}
