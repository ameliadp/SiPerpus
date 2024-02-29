import 'package:nb_utils/nb_utils.dart';

import '../../../utils/utils.dart';
import '../models/models.dart';

class SavedRepository {
  final ApiService _apiService = ApiService.instance;

  Future<dynamic> getSavedBooks() async {
    try {
      final BaseResponse res = await _apiService.get(URL.booksUrl);
      // return mappingBook(res);
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
      final BaseResponse res = await _apiService.post(URL.borrowingUrl, body);
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
      final body = {
        'book_id': bookId.toInt(),
      };
      final BaseResponse res = await _apiService.post(URL.borrowingUrl, body);
      return res.message;
    } on ServerException catch (e) {
      throw e.message;
    } on Failure catch (e) {
      throw e.message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }
}
