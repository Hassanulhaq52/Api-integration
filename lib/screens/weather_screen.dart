import 'package:flutter/material.dart';
import 'package:weather_app/constants/constants.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/api_services.dart';
import 'package:unities_helper/unities_helper.dart';
import 'package:weather_app/widgets/authentication_button.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  ApiService apiService = ApiService();

  int kelToCel(int? temperature) {
    final int tempInCent = temperature! - 273;
    return tempInCent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<WeatherModel?>(
        future: apiService.getWeatherData('Karachi'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final WeatherModel weatherData = snapshot.data!;
            final int? temperature = weatherData.main!.temp;

            return Stack(
              children: [
                Image.asset(
                  "assets/background.jpg",
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Scaffold(
                  backgroundColor: Colors.transparent,
                  body: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          weatherData.name!,
                          style: Constants.weatherStyle,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '${kelToCel(temperature).toString()}°C',
                          style: Constants.weatherStyle,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Wind Speed:',
                          style: Constants.weatherStyle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          weatherData.wind!.speed.toString(),
                          style: Constants.weatherStyle,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AuthenticationButton(
                            title: 'Go to News Screen',
                            colour: Colors.green,
                            onpressed: () {
                              Navigator.pushNamed(context, 'news_screen');
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        AuthenticationButton(
                            title: 'Go to Game Screen',
                            colour: Colors.green,
                            onpressed: () {
                              Navigator.pushNamed(context, 'game_screen');
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        AuthenticationButton(
                            title: 'Go to City Screen',
                            colour: Colors.green,
                            onpressed: () {
                              Navigator.pushNamed(context, 'city_screen');
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        AuthenticationButton(
                            title: 'Go to Title Screen',
                            colour: Colors.green,
                            onpressed: () {
                              Navigator.pushNamed(context, 'title_screen');
                            }),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
