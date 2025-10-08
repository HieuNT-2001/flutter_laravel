import 'package:flutter/material.dart';
import 'package:hoc_flutter/widgets/image_card_item.dart';
import 'package:url_launcher/url_launcher.dart';

class News extends StatelessWidget {
  const News({super.key});

  Future<void> _launchNews() async {
    Uri url = Uri.parse('https://vuatho.com/vi/press');
    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      throw Exception('Không mở được $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tin tức & sự kiện',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...List.generate(3, (index) {
          return GestureDetector(
            onTap: () => _launchNews(),
            child: const ImageCardItem(
              imageSrc: 'assets/images/news.jpg',
              spaceAfter: 16,
            ),
          );
        }),
      ],
    );
  }
}
