import 'package:hive_flutter/hive_flutter.dart';
import '../../Features/home/domain/entities/book_entity.dart';

Future<void> saveData(List<BookEntity> books, String booksName) async {
  var box = Hive.box<BookEntity>(booksName);
  await box.addAll(books);
}
