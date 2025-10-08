import 'package:flutter/material.dart';
import 'package:hoc_flutter/widgets/image_card_item.dart';
import 'package:url_launcher/url_launcher.dart';

class Benefit extends StatelessWidget {
  const Benefit({super.key});

  Future<void> _launchBenefits() async {
    Uri url = Uri.parse('https://vuatho.com/vi#worker-benefit');
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
          'Quyền lợi',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...List.generate(3, (index) {
          return GestureDetector(
            onTap: () => _launchBenefits(),
            child: const ImageCardItem(
              imageSrc: 'assets/images/Benefit.jpg',
              spaceAfter: 16,
            ),
          );
        }),
      ],
    );
  }
}
