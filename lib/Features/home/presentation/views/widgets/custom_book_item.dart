import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';

class CustomBookItem extends StatelessWidget {
  const CustomBookItem({super.key, required this.bookEntity});
  final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.4 / 4,
      child: GestureDetector(
        onTap: () =>
            AppRouter.appRouter.push(RoutePath.kDetailsView, extra: bookEntity),
        child: Container(
          margin: const EdgeInsets.only(top: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            image: DecorationImage(
              image: NetworkImage(
                bookEntity.image ??
                    "https://img.icons8.com/m_outlined/1200/image.jpg",
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
