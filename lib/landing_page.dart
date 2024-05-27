import 'package:assignment_oct_980324106159/news_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Future<void> _launchURL() async {
    final Uri myUrl = Uri.parse('https://www.facebook.com');
    if (!await launchUrl(myUrl)) {
      throw Exception('Cannot launch $myUrl');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Landing Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Image.asset(
                  'images/apple_logo.png',
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              ' Top Stories at Your Fingertips',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              '  Bringing you the latest headlines from around the world.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16), // Add horizontal padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NewsPage()));
                      },
                      child: const Text('Tech Articles'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 0), // Adjusted height here
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16), // Add horizontal padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _launchURL();
                      },
                      child: const Text('Like us on Facebook'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
