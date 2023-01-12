import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/news_model.dart';
import 'package:weather_app/models/weather_model.dart';

class ApiService {
  static const String baseURL = 'https://api.openweathermap.org/';
  static const String apiKey = '26045213ee14d654983128cc5c270adb';

  Future<WeatherModel> getWeatherData(String cityName) async {
    final String endPoint = 'data/2.5/weather?q=$cityName&appid=$apiKey';

    Uri url = Uri.parse(baseURL + endPoint);
    http.Response response = await http.get(url);
    debugPrint('Response status: ${response.statusCode}');
    final body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      WeatherModel weatherModel = WeatherModel.fromJson(body);
      debugPrint('Response body: ${response.body}');
      return weatherModel;
    } else {
      debugPrint('ERROR :$response.statusCode');
    }
    return WeatherModel();
  }
}

class NewsApiService {
  static const String baseURL = 'https://newsapi.org/';
  static const String apiKey = 'fb3dda4660964549935676992a2efb63';

  Future<NewsModel> getNewsData(String countryName) async {
    try{

      final String endPoint = 'v2/top-headlines?country=$countryName&apiKey=$apiKey';

      Uri url = Uri.parse(baseURL + endPoint);
      http.Response response = await http.get(url);
      debugPrint('Response status: ${response.statusCode}');
      final body = jsonDecode(response.body);
      if (response.statusCode == 200) {
        debugPrint('Response body: ${response.body}');
        NewsModel newsModel = NewsModel.fromJson(body);
        // debugPrint('Response body: ${response.body}');
        return newsModel;
      } else {
        debugPrint('ERROR :$response.statusCode');
      }

    }catch(error){
      debugPrint(error.toString());
    }return NewsModel();

  }
}
