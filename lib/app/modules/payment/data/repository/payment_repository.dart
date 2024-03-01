import '../../../utils/utils.dart';

class PaymentRepository {
  final ApiService _apiService = ApiService.instance;

  Future<dynamic> downloadFile(DownloadFileModel downloadFile) async {
    try {
      final BaseResponse res = await _apiService.downloadFile(downloadFile);
      return res.status;
    } on ServerException catch (e) {
      throw e.message;
    } on Failure catch (e) {
      throw e.message;
    } catch (e) {
      throw 'Something went wrong $e';
    }
  }

  Future<bool> requestPermission() async {
    try {
      return await HelperService.requestPermission();
    } on ServerException catch (e) {
      throw e.message;
    } on Failure catch (e) {
      throw e.message;
    } catch (e) {
      throw 'Something went wrong $e';
    }
  }
}
