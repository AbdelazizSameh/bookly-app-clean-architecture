part of 'featured_books_cubit.dart';

@immutable
sealed class FeaturedBooksCubitState {}

final class FeaturedBooksCubitInitialState extends FeaturedBooksCubitState {}

final class FeaturedBooksCubitLoadingState extends FeaturedBooksCubitState {}

final class FeaturedBooksCubitPaginationLoadingState
    extends FeaturedBooksCubitState {}

final class FeaturedBooksCubitPaginationFailureState
    extends FeaturedBooksCubitState {
  final String errorMessage;

  FeaturedBooksCubitPaginationFailureState({required this.errorMessage});
}

final class FeaturedBooksCubitFailureState extends FeaturedBooksCubitState {
  final String errorMessage;
  FeaturedBooksCubitFailureState({required this.errorMessage});
}

final class FeaturedBooksCubitSuccessState extends FeaturedBooksCubitState {
  final List<BookEntity> books;

  FeaturedBooksCubitSuccessState({required this.books});
}
