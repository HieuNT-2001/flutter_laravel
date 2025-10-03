import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  final Uri _url = Uri.parse("https://vuatho.com/vi/press");

  Future<void> _launchNews() async {
    if (!await launchUrl(_url, mode: LaunchMode.inAppWebView)) {
      throw Exception('Không mở được $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Tin tức & sự kiện",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        ...List.generate(3, (index) {
          return GestureDetector(
            onTap: () => _launchNews(),
            child: Container(
              height: 200,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage("assets/images/news.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
