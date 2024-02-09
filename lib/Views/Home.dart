import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_api_app/Views/currentWeatherState.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    // context.read<WeatherApiProvider>().provider();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // context.read<WeatherApiProvider>().provider();
        },
        label: const Icon(Icons.remove_red_eye_sharp),
      ),
      appBar: AppBar(
        title: const Text("Weather Application"),
        leading: const Icon(Icons.add_chart_rounded),
        backgroundColor: Colors.lightGreen,
      ),
      body:
          RefreshIndicator(onRefresh: _refresh, child:CurrentWeatherState()),
    );
  }

  Future<void> _refresh() async {
    // context.read<WeatherApiProvider>().provider();
  }
}
