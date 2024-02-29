import 'package:nb_utils/nb_utils.dart';

import '../../../home/data/data.dart';
import '../../../utils/utils.dart';

class SavedRepository {
  final ApiService _apiService = ApiService.instance;

  Future<dynamic> getSavedBooks() async {
    try {
      final BaseResponse res = await _apiService.get(URL.collectionsUrl);
      return mappingBook(res);
    } on ServerException catch (e) {
      throw e.message;
    } on Failure catch (e) {
      throw e.message;
    } catch (e) {
      throw 'Something went wrong $e';
    }
  }

  Future<String> savedBook(String bookId) async {
    try {
      final body = {
        'book_id': bookId.toInt(),
      };
      final BaseResponse res = await _apiService.post(URL.collectionsUrl, body);
      return res.message;
    } on ServerException catch (e) {
      throw e.message;
    } on Failure catch (e) {
      throw e.message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }

  Future<String> removeFromSaveBook(String bookId) async {
    try {
      final BaseResponse res =
          await _apiService.delete(URL.deleteCollectionUrl(bookId));
      return res.message;
    } on ServerException catch (e) {
      throw e.message;
    } on Failure catch (e) {
      throw e.message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }

  List<BookModel> mappingBook(BaseResponse res) {
    List<BookModel> books = [];
    if (res.data == null || res.data.runtimeType != List) {
      return books;
    }

    for (var element in (res.data as List)) {
      books.add(BookModel.fromJson(element));
    }
    return books;
  }
}
