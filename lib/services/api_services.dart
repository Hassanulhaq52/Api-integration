import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/game_model.dart';
import 'package:weather_app/models/news_model.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/models/city_model.dart';

import 'package:weather_app/models/title_model.dart';

class ApiService {
  static const String baseURL = 'https://api.openweathermap.org/';
  static const String apiKey = '26045213ee14d654983128cc5c270adb';

  Future<WeatherModel?> getWeatherData(String cityName) async {
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
  }
}

class NewsApiService {
  static const String baseURL = 'https://newsapi.org/';
  static const String apiKey = 'fb3dda4660964549935676992a2efb63';

  Future<NewsModel?> getNewsData(String countryName) async {
    try {
      final String endPoint =
          'v2/top-headlines?country=$countryName&apiKey=$apiKey';

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
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}

class GameApiService {
  static const String baseURL = 'https://imdb8.p.rapidapi.com/';

  Future<GameModel?> getGameData() async {
    try {
      final String endPoint = 'auto-complete?q=game of thr';

      Uri url = Uri.parse(baseURL + endPoint);
      http.Response response = await http.get(url, headers: {
        'X-RapidAPI-Key': '8487d2f9c8mshbe76db7eed0196bp1ac7fdjsnc6296c239753',
        'X-RapidAPI-Host': 'imdb8.p.rapidapi.com',
      });
      debugPrint('Response status: ${response.statusCode}');
      final body = jsonDecode(response.body);
      if (response.statusCode == 200) {
        debugPrint('Response body: ${response.body}');
        GameModel gameModel = GameModel.fromJson(body);
        // debugPrint('Response body: ${response.body}');
        return gameModel;
      } else {
        debugPrint('ERROR :$response.statusCode');
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}

class CityApiService {
  static const String baseURL = 'https://wft-geo-db.p.rapidapi.com/';

  Future<CityModel?> getCityData() async {
    try {
      final String endPoint = 'v1/geo/cities';

      Uri url = Uri.parse(baseURL + endPoint);
      http.Response response = await http.get(url, headers: {
        'X-RapidAPI-Key': '8487d2f9c8mshbe76db7eed0196bp1ac7fdjsnc6296c239753',
        'X-RapidAPI-Host': 'wft-geo-db.p.rapidapi.com'
      });
      debugPrint('Response status: ${response.statusCode}');
      final body = jsonDecode(response.body);
      if (response.statusCode == 200) {
        debugPrint('Response body: ${response.body}');
        CityModel cityModel = CityModel.fromJson(body);
        // debugPrint('Response body: ${response.body}');
        return cityModel;
      } else {
        debugPrint('ERROR :$response.statusCode');
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}

class TitleApiService {
  static const String baseURL = 'https://imdb8.p.rapidapi.com/';

  Future<TitleModel?> getTitleData() async {
    try {
      final String endPoint = 'title/get-awards-summary?tconst=tt0944947';

      Uri url = Uri.parse(baseURL + endPoint);
      http.Response response = await http.get(url, headers: {
        'X-RapidAPI-Key': '8487d2f9c8mshbe76db7eed0196bp1ac7fdjsnc6296c239753',
        'X-RapidAPI-Host': 'imdb8.p.rapidapi.com'
      });
      debugPrint('Response status: ${response.statusCode}');
      final body = jsonDecode(response.body);
      if (response.statusCode == 200) {
        debugPrint('Response body: ${response.body}');
        TitleModel titleModel = TitleModel.fromJson(body);
        // debugPrint('Response body: ${response.body}');
        return titleModel;
      } else {
        debugPrint('ERROR :$response.statusCode');
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
