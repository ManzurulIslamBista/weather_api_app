import 'package:flutter/cupertino.dart';
import 'package:weather_api_app/Models/weather_model.dart';
import 'package:weather_api_app/Repository/api_response.dart';

class CurrentWeather extends ChangeNotifier{
String domain = "https://api.openweathermap.org";
String baseUrl = "/data/2.5/weather?lat=23.7427306&lon=90.3777873&appid=";
WeatherModel? responseOfWeatherModel;
String  apiid = "78d0a5ceb0b644ac8d9c478d67ce5ab4";

Future<WeatherModel?> getCurrentWeather(String appid, String lat, String lon) async {
  if (appid != ""){
    dynamic responseOfApi = await ApiResponse().getResponse(domain, "/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${appid}");
    responseOfWeatherModel = WeatherModel.fromJson(responseOfApi);
  }
  else {
    dynamic responseOfApi = await ApiResponse().getResponse(domain, "/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${apiid}");
    responseOfWeatherModel = WeatherModel.fromJson(responseOfApi);
  }
  print(responseOfWeatherModel?.main?.temp);
  notifyListeners();
  return responseOfWeatherModel;
}
}