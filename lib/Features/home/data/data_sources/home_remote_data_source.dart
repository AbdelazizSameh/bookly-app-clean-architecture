import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/constants.dart';

import '../../../../core/functions/save_local_data_box.dart';
import '../../../../core/utils/api_service.dart';
import '../../domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImplementation extends HomeRemoteDataSource {
  HomeRemoteDataSourceImplementation(this.apiService);

  final ApiService apiService;

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var result = await apiService.get(
      endPoint:
          'volumes?Filtering=free-ebooks&q=Programming&startIndex=${pageNumber * 10}',
    );
    List<BookEntity> books = getBooksList(result);
    await saveData(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var result = await apiService.get(
      endPoint: 'volumes?Filtering=free-ebooks&q=anime',
    );
    List<BookEntity> books = getBooksList(result);

    await saveData(books, kNewestBox);

    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> result) {
    List<BookEntity> books = (result['items'] as List)
        .map((book) => BookModel.fromJson(book))
        .toList();
    return books;
  }
}
