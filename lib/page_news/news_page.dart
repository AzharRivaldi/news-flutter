import 'package:flutter/material.dart';

import 'package:news_flutter/model/model_news.dart';
import 'package:news_flutter/network/network_services.dart';
import 'package:news_flutter/page_detail/detail_page.dart';
import 'package:news_flutter/utils/tools.dart';

class NewsPage extends StatelessWidget {

  final String kategori;

  const NewsPage({super.key, required this.kategori});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<ModelNews>>(
        future: NetworkService.fetchNews(kategori),
        builder: (context, snapshot) {
          final listData = snapshot.data;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xffe1b859))
              ),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text("Ups, Error!", style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)
              ),
            );
          }

          return ListView.builder(
            itemCount: listData!.length,
            itemBuilder: (context, index) {
              var data = listData[index];
              return GestureDetector(
                onTap: () {
                  String strLinkWeb = data.link.toString();
                  String strTitleWeb = data.title.toString();
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailPage(
                          strLink: strLinkWeb, strTitle: strTitleWeb))
                  );
                },
                child: Card(
                    margin: const EdgeInsets.all(10),
                    clipBehavior: Clip.antiAlias,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(TimeAgo.setTimeAgo(data.pubDate.toString()),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold
                              ),
                          ),
                          const SizedBox(
                              height: 20
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      data.title.toString(),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16
                                      ), maxLines: 2,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      data.description.toString(),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 12
                                      ), maxLines: 2,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                width: 80,
                                height: 80,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: SizedBox.fromSize(
                                    size: const Size.fromRadius(20),
                                    child: Image.network(data.thumbnail.toString(),
                                        fit: BoxFit.cover
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                              height: 20
                          ),
                          Text(SetDate.setDate(data.pubDate.toString()),
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10
                              ),
                          )
                        ],
                      ),
                    )),
              );
            },
          );
        },
      ),
    );
  }
}
