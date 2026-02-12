import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import '/Features/home/domain/entities/book_entity.dart';
import 'package:meta/meta.dart';
part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksCubitState> {
  FeaturedBooksCubit(this.fetchFeaturedBooksUseCase)
    : super(FeaturedBooksCubitInitialState());

  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;
  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeaturedBooksCubitLoadingState());
    } else {
      emit(FeaturedBooksCubitPaginationLoadingState());
    }
    var result = await fetchFeaturedBooksUseCase.call(pageNumber);
    result.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(
            FeaturedBooksCubitFailureState(errorMessage: failure.errorMessage),
          );
        } else {
          emit(
            FeaturedBooksCubitPaginationFailureState(
              errorMessage: failure.errorMessage,
            ),
          );
        }
      },
      (books) {
        emit(FeaturedBooksCubitSuccessState(books: books));
      },
    );
  }
}
