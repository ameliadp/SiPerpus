import '../../../utils/utils.dart';

class ProfileRepository {
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
}
