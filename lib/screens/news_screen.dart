import 'package:flutter/material.dart';

import 'package:weather_app/models/news_model.dart';

import 'package:weather_app/services/api_services.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  NewsApiService newsApiService = NewsApiService();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/news_background.jpg",
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          body: FutureBuilder<NewsModel>(
            future: newsApiService.getNewsData('au'),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final NewsModel newsData = snapshot.data!;
                // log('news Data ${newsData.toJson().toString()}');

                return ListView.builder(
                    itemCount: newsData.articles?.length,
                    itemBuilder: (context, index) {
                      Articles? article = snapshot.data!.articles![index];

                      return Card(
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(8),
                          title: Column(
                            children: [
                              article.urlToImage != 'null'
                                  ? Container(
                                width: double.infinity,
                                height: 240,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          article.urlToImage ?? ''),
                                      fit: BoxFit.fill),
                                ),
                              )
                                  : Container(
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(20),
                                color: Colors.red,
                                child: const Text(
                                  "Image not available",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
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
                                      article.source!.name!,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),

                                  ),
                                ],
                              ),
                            ],
                          ),
                          subtitle: Text(article.title!),
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
