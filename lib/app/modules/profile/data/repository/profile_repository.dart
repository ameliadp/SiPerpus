import '../models/req_update_profile.dart';

import '../../../utils/utils.dart';

class ProfileRepository {
  final ApiService _apiService = ApiService.instance;
  final StorageService _storageService = StorageService.instance;
  Future<UserModel?> getProfile() async {
    try {
      UserModel? resUser = await _storageService.getUser();
      return resUser;
    } on ServerException catch (e) {
      throw e.message;
    } on Failure catch (e) {
      throw e.message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }

  Future<UserModel?> updateProfile(ReqUpdateProfile reqUpdateProfile) async {
    try {
      final response = await _apiService.post(
          URL.updateProfileUrl, reqUpdateProfile.toJson());
      final resUser = await _storageService.getUser();

      UserModel? user = resUser!.copyWith(email: reqUpdateProfile.email);
      _storageService.saveUser(user);

      return user;
    } on ServerException catch (e) {
      throw e.message;
    } on Failure catch (e) {
      throw e.message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }
}
