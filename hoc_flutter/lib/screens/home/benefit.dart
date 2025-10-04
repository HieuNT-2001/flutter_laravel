import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Benefit extends StatefulWidget {
  const Benefit({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BenefitState createState() => _BenefitState();
}

class _BenefitState extends State<Benefit> {
  final Uri _url = Uri.parse('https://vuatho.com/vi#worker-benefit');

  Future<void> _launchBenefits() async {
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
          'Quyền lợi',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        ...List.generate(3, (index) {
          return GestureDetector(
            onTap: () => _launchBenefits(),
            child: Container(
              height: 200,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage('assets/images/Benefit.jpg'),
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
