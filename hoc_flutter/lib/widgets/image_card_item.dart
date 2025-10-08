import 'package:flutter/material.dart';

class ImageCardItem extends StatelessWidget {
  final String? title;
  final String imageSrc;
  final VoidCallback? onTap;
  final double? spaceBefore;
  final double? spaceAfter;

  const ImageCardItem({
    super.key,
    this.title,
    required this.imageSrc,
    this.onTap,
    this.spaceBefore = 0,
    this.spaceAfter = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: spaceBefore),
        if (title != null) ...[
          Text(
            title!,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
        ],
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imageSrc),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SizedBox(height: spaceAfter),
      ],
    );
  }
}
