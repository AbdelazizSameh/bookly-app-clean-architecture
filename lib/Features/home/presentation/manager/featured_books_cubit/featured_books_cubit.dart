import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo_implementation.dart';
import 'package:bookly_app/Features/home/domain/repos/home_repo.dart';
import '/Features/home/domain/entities/book_entity.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksCubitState> {
  FeaturedBooksCubit() : super(FeaturedBooksCubitInitialState());
  late List<BookEntity> books;

  
}
