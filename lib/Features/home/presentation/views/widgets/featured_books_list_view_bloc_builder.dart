import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/functions/build_error_widget.dart';
import 'featured_books_list_view.dart';

class FeaturedBooksListViewBlocBuilder extends StatefulWidget {
  const FeaturedBooksListViewBlocBuilder({super.key});

  @override
  State<FeaturedBooksListViewBlocBuilder> createState() =>
      _FeaturedBooksListViewBlocBuilderState();
}

class _FeaturedBooksListViewBlocBuilderState
    extends State<FeaturedBooksListViewBlocBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksCubitState>(
      listener: (BuildContext context, FeaturedBooksCubitState state) {
        if (state is FeaturedBooksCubitSuccessState) {
          books.addAll(state.books);
        }
        if (state is FeaturedBooksCubitPaginationFailureState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(buildErrorSnackbar(state.errorMessage));
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksCubitSuccessState ||
            state is FeaturedBooksCubitPaginationLoadingState) {
          return FeaturedBooksListView(books: books);
        } else if (state is FeaturedBooksCubitFailureState) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
