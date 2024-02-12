import 'package:digitallibrary/app/modules/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../models/models.dart';
import 'storage_service.dart';

class CustomInterceptors extends Interceptor {
  const CustomInterceptors();
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final StorageService storageService = StorageService.instance;
    final UserModel? user = await storageService.getUser();
    if (user != null) {
      options.headers['Authorization'] = 'Bearer ${user.token}';
    }

    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
    response,
    ResponseInterceptorHandler handler,
  ) async {
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    dismissLoading();
    final StorageService storageService = StorageService.instance;
    if (err.response?.statusCode == 401) {
      await storageService.clearUser();
      Get.offAllNamed(Routes.LOGIN);
      return;
    }
    return super.onError(err, handler);
  }
}
