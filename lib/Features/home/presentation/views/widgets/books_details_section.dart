import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_item.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    var book = GoRouter.of(context).state.extra as BookEntity;
    return Column(
      children: [
        SizedBox(
          width: screenWidth * 0.38,
          child: CustomBookItem(bookEntity: book),
        ),
        const SizedBox(height: 43),
        Text(
          book.title,
          textAlign: TextAlign.center,
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 6),
        Text(
          book.authorName,
          style: Styles.textStyle18.copyWith(
            color: const Color(0xffB8B6BD),
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 18),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: book.rating,
        ),
        const SizedBox(height: 37),
        const BooksAction(),
      ],
    );
  }
}
