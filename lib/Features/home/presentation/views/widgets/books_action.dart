import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../domain/entities/book_entity.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key});

  @override
  Widget build(BuildContext context) {
    var book = GoRouter.of(context).state.extra as BookEntity;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      child: Row(
        children: [
          CustomButton(
            text: '${book.price}€',
            backgroundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: const BorderRadiusGeometry.only(
              bottomLeft: Radius.circular(16),
              topLeft: Radius.circular(16),
            ),
          ),
          const CustomButton(
            text: 'Free preview',
            fontSize: 16,
            textColor: Colors.white,
            backgroundColor: Color(0xffEF8262),
            borderRadius: BorderRadiusGeometry.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
        ],
      ),
    );
  }
}
