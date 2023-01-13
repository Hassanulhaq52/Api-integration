import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_app/models/game_model.dart';
import 'package:weather_app/services/api_services.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  GameApiService gameApiService = GameApiService();

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
          body: FutureBuilder<GameModel>(
            future: gameApiService.getGameData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final GameModel gameData = snapshot.data!;

                log('game Data ${gameData.toJson().toString()}');

                return ListView.builder(
                    itemCount: gameData.d?.length,
                    itemBuilder: (context, index) {
                      // Articles? article = snapshot.data!.articles![index];
                      D? datad = snapshot.data!.d![index];

                      return Card(
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(8),
                          title: Column(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  datad!.l.toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          subtitle: Text('Rank: ${datad.rank.toString()}'),
                        ),
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
