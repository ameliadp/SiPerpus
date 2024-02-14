import 'package:nb_utils/nb_utils.dart';

import '../../../utils/utils.dart';
import '../models/models.dart';

class HomeRepository {
  final ApiService _apiService = ApiService.instance;
  final StorageService _storageService = StorageService.instance;

  Future<List<BookModel>> getBooks() async {
    try {
      final BaseResponse res = await _apiService.get(URL.booksUrl);
      return mappingBook(res);
    } on ServerException catch (e) {
      throw e.message;
    } on Failure catch (e) {
      throw e.message;
    } catch (e) {
      throw 'Something went wrong $e';
    }
  }

  Future<List<BookModel>> getPopularBooks() async {
    try {
      final BaseResponse res = await _apiService.get(URL.popularBooksUrl);
      return mappingBook(res);
    } on ServerException catch (e) {
      throw e.message;
    } on Failure catch (e) {
      throw e.message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }

  Future<List<BookModel>> getBooksByCategory(String categoryId) async {
    try {
      final BaseResponse res =
          await _apiService.get(URL.booksWithCategoryUrl(categoryId));
      return mappingBook(res);
    } on ServerException catch (e) {
      throw e.message;
    } on Failure catch (e) {
      throw e.message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }

  Future<List<CategoryModel>> getCategories() async {
    try {
      final BaseResponse res = await _apiService.get(URL.categoriesUrl);
      List<CategoryModel> categories = [];
      if (res.data == null || res.data.runtimeType != List) {
        return categories;
      }

      for (var element in (res.data as List)) {
        categories.add(CategoryModel.fromJson(element));
      }
      return categories;
    } on ServerException catch (e) {
      throw e.message;
    } on Failure catch (e) {
      throw e.message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }

  Future<BookModel> getBook(String bookId) async {
    try {
      final BaseResponse res = await _apiService.get('${URL.booksUrl}/$bookId');
      return BookModel.fromJson(res.data);
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

  Future<UserModel> getDetailUser() async {
    try {
      final (res, currentUser) = await (
        _apiService.get(URL.profileUrl),
        _storageService.getUser()
      ).wait;
      UserModel resUser = UserModel.fromJson(res.data);
      resUser = resUser.copyWith(token: currentUser?.token);
      _storageService.saveUser(resUser);
      return resUser;
    } on ServerException catch (e) {
      throw e.message;
    } on Failure catch (e) {
      throw e.message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }

  Future<String> borrowBook(String bookId) async {
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
