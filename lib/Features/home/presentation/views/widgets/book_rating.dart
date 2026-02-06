import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start, required this.rating,
  });
  final num rating;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38.0),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        spacing: 6.3,
        children: [
          const Icon(
            FontAwesomeIcons.solidStar,
            color: Colors.yellow,
            size: 14,
          ),
          Text(
            rating.toString(),
            style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
          ),
          const Text('(0)', style: Styles.textStyle14),
        ],
      ),
    );
  }
}
