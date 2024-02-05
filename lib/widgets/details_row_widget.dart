import 'package:animate_do/animate_do.dart';
import 'package:catbreeds/widgets/text_default_widget.dart';
import 'package:flutter/material.dart';

class DetailsRow extends StatelessWidget {
  const DetailsRow({
    super.key,
    required this.resume,
    required this.title,
  });

  final String resume;
  final String title;
  @override
  Widget build(BuildContext context) {
    return BounceInUp(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            TextDefault(
              sizeText: 16,
              colorText: const Color.fromARGB(255, 51, 1, 60),
              text: title,
              fontWeight: FontWeight.w700,
            ),
            const SizedBox(width: 8),
            TextDefault(
              sizeText: 14,
              overflow: TextOverflow.visible,
              colorText: const Color.fromARGB(255, 51, 1, 60),
              text: resume,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
