import 'package:permission_handler/permission_handler.dart';

class HelperService {
  static Future<bool> requestPermission() async {
    PermissionStatus result;
    result = await Permission.storage.request();
    if (result.isGranted) {
      return true;
    } else {
      return false;
    }
  }
}
