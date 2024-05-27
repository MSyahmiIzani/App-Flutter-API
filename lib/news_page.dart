// ignore_for_file: avoid_print

import 'package:assignment_oct_980324106159/details_page.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final Dio dio = Dio();
  final baseUrl =
      'https://www.alphavantage.co/query?function=NEWS_SENTIMENT&topics=technology&apikey=OQ7SATB501OYA2BL';
  var jsonList = [];

  @override
  void initState() {
    super.initState();
    getData();
    // TODO: implement setState
  }

  Future<void> getData() async {
    try {
      var myResponse = await Dio().get(baseUrl);
      if (myResponse.statusCode == 200) {
        print("API Total is: ${myResponse.data['items']}");
        print("API Result: ${myResponse.data}");

        setState(() {
          jsonList = myResponse.data['feed'] as List;
        });
      } else {
        print("Issue on API: ${myResponse.statusCode}");
      }
    } catch (e) {
      print("Failure to get posts: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Dio"),
      ),
      body: ListView.builder(
          itemCount: jsonList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage(
                              postData: jsonList[index],
                            )));
              },
              child: ListTile(
                leading: Image(
                  image: NetworkImage(jsonList[index]['banner_image'] ??
                      "https://via.placeholder.com/50"),
                ),
                title: Text(jsonList[index]["title"] ?? ""),
                subtitle: Text(jsonList[index]["summary"] ?? ""),
              ),
            );
          }), 
    );
  }
}
