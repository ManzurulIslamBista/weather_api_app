import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_api_app/Repository/api_response.dart';
import 'package:weather_api_app/ViewModels/current_weather.dart';
import 'package:weather_api_app/Views/Home.dart';


void main() {
  runApp(

    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CurrentWeather()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
