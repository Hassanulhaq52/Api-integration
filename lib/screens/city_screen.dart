import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:weather_app/models/city_model.dart';
import 'package:weather_app/services/api_services.dart';
import 'package:weather_app/constants/constants.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      appBar: AppBar(
        title: const Text('City Screen'),
      ),
      body: FutureBuilder<CityModel?>(
        future: apiServices.getCityData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final CityModel cityData = snapshot.data!;
            log('game Data ${cityData.toJson().toString()}');
            return Theme(
              data: ThemeData(
                highlightColor: Colors.grey.shade300,
              ),
              child: Scrollbar(
                thickness: 10,
                thumbVisibility: true,
                child: ListView.builder(
                    itemCount: cityData.data?.length,
                    itemBuilder: (context, index) {
                      Data? cityData = snapshot.data!.data![index];

                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 1,
                            ),
                            child: Card(
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5.0),
                                title: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                        vertical: 10,
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        'City Name: ${cityData.name.toString()}',
                                        style: Constants.containerStyle,
                                      ),
                                    ),
                                    Text(
                                      'Country Code: ${cityData.countryCode}',
                                      style: Constants.textStyle,
                                    ),
                                    Text(
                                      'Region: ${cityData.region}',
                                      style: Constants.textStyle,
                                    ),
                                    Text(
                                      'Region Code: ${cityData.regionCode}',
                                      style: Constants.textStyle,
                                    ),
                                    Text(
                                      'Country: ${cityData.country}',
                                      style: Constants.textStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
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
