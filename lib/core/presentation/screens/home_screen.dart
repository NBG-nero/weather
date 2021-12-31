import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weath/core/data/dataProviders/providers/weather_provider.dart';
// import 'package:weath/core/data/models/error_model.dart';
// import 'package:weath/core/data/models/success_model.dart';
// import 'package:weath/core/misc/extras/customtoast.dart';
// import 'package:weath/core/presentation/screens/searchscreen.dart';
// import 'package:weath/core/presentation/widgets/loading.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
        builder: (context, weatherProvider, child) {
      return
          // weatherProvider.loading ?
          // const LoadingWidget()
          // :

          Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.all(10.0),

          // constraints: const BoxConstraints.expand(),

          child: Center(
            child:
                // crossAxisAlignment: CrossAxisAlignment.stretch,

                TextFormField(
                    controller: searchCtrl,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      // prefixIcon: const Icon(Icons.search_outlined),

                      suffix: GestureDetector(
                        child: const Icon(
                          Icons.clear,
                          size: 18,
                          color: Colors.white38,
                        ),
                        onTap: () {
                          searchCtrl.text = '';
                        },
                      ),

                      hintStyle: const TextStyle(
                          fontSize: 18.0, color: Colors.white30),
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    // onChanged: (value) {

                    // },

                    onEditingComplete: () {
                      weatherProvider.getWeather(searchCtrl.text, context);

                      // weatherProvider.loading == true;
                      // if (weatherProvider.loading == true) {
                      //   const LoadingWidget();
                      // } else {
                      //   Navigator.of(context).pushNamed('w');
                      // }
                    }

                    // onTap:  () async {
                    //   //
                    //   showSearch(context: context, delegate: CitySearch());
                    // },
                    ),
          ),
        ),
      );
    });
  }
}
