part of 'newest_books_cubit.dart';

@immutable
sealed class FetchNewestBooksState {}

final class FetchNewestBooksInitialState extends FetchNewestBooksState {}

final class FetchNewestBooksLoadingState extends FetchNewestBooksState {}

final class FetchNewestBooksFailureState extends FetchNewestBooksState {
  final String errorMessage;

  FetchNewestBooksFailureState({required this.errorMessage});
}

final class FetchNewestBooksSuccessState extends FetchNewestBooksState {
  final List<BookEntity> books;

  FetchNewestBooksSuccessState({required this.books});
}
