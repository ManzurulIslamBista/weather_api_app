import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_api_app/Models/weather_model.dart';
import 'package:weather_api_app/ViewModels/current_weather.dart';


class CurrentWeatherState extends StatefulWidget {

  const CurrentWeatherState({Key? key,}):super(key: key);

  @override
  State<CurrentWeatherState> createState() => _CurrentWeatherStateState();
}

class _CurrentWeatherStateState extends State<CurrentWeatherState> {
  WeatherModel? currentWeather;
  final _appidController = TextEditingController();
  final _latController = TextEditingController();
  final _lonController = TextEditingController();
  String api = '';
  String lat = "23.7427306";
  String lon = "90.3777873";

  @override
  void initState() {
    super.initState();
    _fetchCurrentWeather(api,lat,lon);
  }

  Future<void> _fetchCurrentWeather(String api,String lat,String lon) async {
    currentWeather = await context.read<CurrentWeather>().getCurrentWeather(this.api,this.lat,this.lon);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return currentWeather != null
        ? SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 15, 8, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width / 1.1,
                  color: Colors.white,
                  child: Center(
                    child: Text(
                        "Temperature : ${((currentWeather!.main!.temp ?? 0) - 273.15).toStringAsFixed(2)}°C\n Humidity : ${(currentWeather!.main!.humidity ?? 0)}",style: TextStyle(fontSize: 20),),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),

            Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 350,
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: "Latitude {default : 23.7427306}",
                        ),
                        controller: _latController,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 350,
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: "Longitude {default : 90.3777873}",
                        ),
                        controller: _lonController,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child:
                  Row(
                    children: [
                      const Column(
                        children: [
                          Text("API : ",style: TextStyle(fontSize: 20),)
                        ],
                      ),
                      Column(children: [
                        Container(
                          width: 300,
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText: "API",
                            ),
                            controller: _appidController,
                          ),
                        )

                      ],),
                    ],
                  ),



                )
              ],
            ),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                api = _appidController.text.trim();
                lat = _latController.text.trim();
                lon = _lonController.text.trim();
                _fetchCurrentWeather(api,lat,lon);
              },
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 110,height: 40,
                  color: Colors.blue,
                  child: const Text(" Get Value",style: TextStyle(fontSize: 20),),)
                ],

              ),
            )
          ],
        ),
      ),
    )
        : const Center(child: CircularProgressIndicator()); // Show loading indicator while fetching data
  }
}