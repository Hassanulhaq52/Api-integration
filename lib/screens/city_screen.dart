import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_app/models/city_model.dart';
import 'package:weather_app/models/game_model.dart';
import 'package:weather_app/services/api_services.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  CityApiService cityApiService = CityApiService();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/news_background.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          body: FutureBuilder<CityModel?>(
            future: cityApiService.getCityData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final CityModel cityData = snapshot.data!;

                log('game Data ${cityData.toJson().toString()}');

                return ListView.builder(
                    itemCount: cityData.data?.length,
                    itemBuilder: (context, index) {
                      // Articles? article = snapshot.data!.articles![index];
                      // Links? linkData = snapshot.data!.links![index];
                      Data? cityData = snapshot.data!.data![index];

                      return Column(
                        children: [
                          Card(
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(8),
                              title: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Text(
                                      'City Name: ${cityData.name.toString()}',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    'Country Code: ${cityData.countryCode}',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Region: ${cityData.region}',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Region Code: ${cityData.regionCode}',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              subtitle: Text('Country: ${cityData.country}'),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    });
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ],
    );
  }
}
