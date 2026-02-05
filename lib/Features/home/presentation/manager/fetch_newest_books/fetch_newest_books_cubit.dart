import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:meta/meta.dart';

part 'fetch_newest_books_state.dart';

class FetchNewestBooksCubit extends Cubit<FetchNewestBooksState> {
  FetchNewestBooksCubit(this.fetchNewestBooksUseCase)
    : super(FetchNewestBooksInitialState());

  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> fetchFeaturedBooks() async {
    emit(FetchNewestBooksInitialState());
    var result = await fetchNewestBooksUseCase.call();
    result.fold(
      (failure) {
        emit(FetchNewestBooksFailureState(errorMessage: failure.errorMessage));
      },
      (books) {
        emit(FetchNewestBooksSuccessState(books: books));
      },
    );
  }
}
