import 'package:flutter/material.dart';
import 'package:weather_app/models/game_model.dart';
import 'package:weather_app/services/api_services.dart';
import 'package:weather_app/constants/constants.dart';
import 'package:weather_app/widgets/image_not_available_container.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      appBar: AppBar(
        title: const Text('Game Screen'),
      ),
      body: FutureBuilder<GameModel?>(
        future: apiServices.getGameData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final GameModel gameData = snapshot.data!;

            return Theme(
              data: ThemeData(
                highlightColor: Colors.grey.shade300,
              ),
              child: Scrollbar(
                thickness: 10,
                thumbVisibility: true,
                child: ListView.builder(
                    itemCount: gameData.d?.length,
                    itemBuilder: (context, index) {
                      D? datad = snapshot.data!.d![index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 1,
                        ),
                        child: Card(
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(8),
                            title: Column(
                              children: [
                                datad.i!.imageUrl != 'null'
                                    ? Container(
                                        width: double.infinity,
                                        height: 240,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  datad.i!.imageUrl ?? ''),
                                              fit: BoxFit.cover),
                                        ),
                                      )
                                    : const ImageNAContainer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                        datad.l!,
                                        style: Constants.containerStyle,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            subtitle: Text('Rank: ${datad.rank.toString()}'),
                          ),
                        ),
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
