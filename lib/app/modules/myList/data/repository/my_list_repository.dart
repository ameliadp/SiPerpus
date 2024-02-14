import '../models/models.dart';
import '../../../utils/utils.dart';

class MyListRepository {
  final ApiService _apiService = ApiService.instance;
  Future<List<BorrowedBook>> getBorrowedBooks() async {
    try {
      final BaseResponse res = await _apiService.get(URL.borrowingUrl);
      List<BorrowedBook> borrowedBooks = [];
      if (res.data == null || res.data.runtimeType != List) {
        return borrowedBooks;
      }

      for (var element in (res.data as List)) {
        borrowedBooks.add(BorrowedBook.fromJson(element));
      }
      return borrowedBooks;
    } on ServerException catch (e) {
      throw e.message;
    } on Failure catch (e) {
      throw e.message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }

  Future<String> submitReview(ReqSubmitReview reqSubmitReview) async {
    try {
      final BaseResponse res =
          await _apiService.post(URL.borrowingUrl, reqSubmitReview.toJson());
      return res.message;
    } on ServerException catch (e) {
      throw e.message;
    } on Failure catch (e) {
      throw e.message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }

  Future<TotalFine> getTotalFine(String borrowId) async {
    try {
      final body = {'borrow_id': 4};
      final BaseResponse res =
          await _apiService.get(URL.totalFineUrl, body: body);
      return TotalFine.fromJson(res.data);
    } on ServerException catch (e) {
      throw e.message;
    } on Failure catch (e) {
      throw e.message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }
}
