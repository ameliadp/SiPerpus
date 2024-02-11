import '../../../utils/utils.dart';
import '../data.dart';

class AuthRepository {
  final ApiService _apiService = ApiService.instance;
  final StorageService _storageService = StorageService.instance;

  Future<UserModel?> login(ReqLoginModel reqLoginModel) async {
    try {
      final BaseResponse res =
          await _apiService.post(URL.loginUrl, reqLoginModel.toJson());
      final ResLoginModel resLoginModel = ResLoginModel.fromJson(res.data);
      final UserModel user = UserModel(token: resLoginModel.token);
      await _storageService.saveUser(user);
      return user;
    } on ServerException catch (e) {
      throw e.message;
    } on Failure catch (e) {
      throw e.message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }

  Future<String> register(ReqRegisterModel reqRegisterModel) async {
    try {
      final BaseResponse res =
          await _apiService.post(URL.registerUrl, reqRegisterModel.toJson());
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
