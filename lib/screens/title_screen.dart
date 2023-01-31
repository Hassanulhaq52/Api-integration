import 'package:flutter/material.dart';
import 'package:weather_app/constants/constants.dart';
import 'package:weather_app/models/title_model.dart';
import 'package:weather_app/services/api_services.dart';

class TitleScreen extends StatefulWidget {
  const TitleScreen({Key? key}) : super(key: key);

  @override
  State<TitleScreen> createState() => _TitleScreenState();
}

class _TitleScreenState extends State<TitleScreen> {
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      appBar: AppBar(
        title: const Text('Title Screen'),
      ),
      body: FutureBuilder<TitleModel?>(
        future: apiServices.getTitleData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final TitleModel titleData = snapshot.data!;

            return Theme(
              data: ThemeData(
                highlightColor: Colors.grey.shade300,
              ),
              child: Scrollbar(
                thickness: 10,
                thumbVisibility: true,
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      Highlighted? highlightedData =
                          snapshot.data!.awardsSummary!.highlighted;
                      HighlightedRanking? highlightedRanking =
                          snapshot.data!.highlightedRanking;

                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 1,
                            ),
                            child: Card(
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
                                        style: Constants.containerStyle,
                                      ),
                                    ),
                                    Text(
                                      'Title: ${titleData.title}',
                                      style: Constants.textStyle,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Count: ${highlightedData.count}',
                                      style: Constants.textStyle,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Event ID: ${highlightedData.eventId}',
                                      style: Constants.textStyle,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Rank: ${highlightedRanking!.rank.toString()}',
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
