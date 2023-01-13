import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_app/models/city_model.dart';
import 'package:weather_app/models/game_model.dart';
import 'package:weather_app/models/title_model.dart';
import 'package:weather_app/services/api_services.dart';

class TitleScreen extends StatefulWidget {
  const TitleScreen({Key? key}) : super(key: key);

  @override
  State<TitleScreen> createState() => _TitleScreenState();
}

class _TitleScreenState extends State<TitleScreen> {
  TitleApiService titleApiService = TitleApiService();

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
          body: FutureBuilder<TitleModel?>(
            future: titleApiService.getTitleData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final TitleModel titleData = snapshot.data!;

                log('game Data ${titleData.toJson().toString()}');

                return ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      // Articles? article = snapshot.data!.articles![index];
                      // Links? linkData = snapshot.data!.links![index];
                      Highlighted? highlightedData =
                          snapshot.data!.awardsSummary!.highlighted;
                      HighlightedRanking? highlightedRanking =
                          snapshot.data!.highlightedRanking;

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
                                      'Award Name: ${highlightedData!.awardName}',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    'Count: ${highlightedData.count}',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Event ID: ${highlightedData.eventId}',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),

                                  // Text(
                                  //   'Is Winner: ${highlightedData.isWinner}',
                                  //   style: const TextStyle(
                                  //       color: Colors.black,
                                  //       fontSize: 17,
                                  //       fontWeight: FontWeight.bold),
                                  // ),
                                ],
                              ),
                              subtitle: Text(
                                  'Is Winner: ${highlightedData.isWinner}'),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
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
                                      'Highlighted ranking',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    'ID: ${highlightedRanking!.id}',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Event ID: ${highlightedData.eventId}',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),

                                  // Text(
                                  //   'Is Winner: ${highlightedData.isWinner}',
                                  //   style: const TextStyle(
                                  //       color: Colors.black,
                                  //       fontSize: 17,
                                  //       fontWeight: FontWeight.bold),
                                  // ),
                                ],
                              ),
                              subtitle: Text(
                                  'Is Winner: ${highlightedData.isWinner}'),
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
