import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.postData});

  final Map<String, dynamic> postData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Passing Detail"),
        ),
        body: Center(
            child: Column(
          children: [
            Image(
              image: NetworkImage(postData['banner_image'] ?? "ERROR"),
            ),
            Text(
              "${postData["title"]}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("${postData["summary"]}"),
          ],
        )));
  }
}
