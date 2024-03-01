import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

import '../constants/url.dart';
import '../models/models.dart';
import 'services.dart';

class ApiService {
  late Dio _dio;

  ApiService._() {
    _init();
  }

  static final instance = ApiService._();

  Future<void> _init() async {
    _dio = Dio();
    _dio.options.connectTimeout = const Duration(milliseconds: 5000);
    _dio.options.baseUrl = URL.baseUrl;
    _dio.interceptors.add(const CustomInterceptors());
    _dio.interceptors.add(PrettyDioLogger());
  }

  BaseResponse parseResponse(
    Response response,
  ) {
    try {
      final BaseResponse baseResponse = BaseResponse.fromJson(response.data);
      if (baseResponse.status == 200) {
        return baseResponse;
      }
      throw ServerException(baseResponse.message);
    } catch (e) {
      rethrow;
    }
  }

  dynamic parseError(DioException e) {
    if (e.type == DioExceptionType.badResponse) {
      BadResponse badResponse = BadResponse.fromJson(e.response?.data);
      throw ServerException(badResponse.error ?? badResponse.message ?? '');
    }
    if (e.type == DioExceptionType.connectionTimeout) {
      throw const ServerFailure('check your connection');
    }

    if (e.type == DioExceptionType.receiveTimeout) {
      throw const ServerFailure('unable to connect to the server');
    }

    if (e.type == DioExceptionType.unknown) {
      throw const ServerFailure('Something went wrong');
    }
  }

  Future<BaseResponse> post(
    String endpoints,
    Map<String, dynamic> body, {
    Map<String, dynamic>? headers,
  }) async {
    try {
      final Response response = await _dio.post(
        endpoints,
        data: jsonEncode(body),
        options: Options(headers: headers),
      );
      return parseResponse(response);
    } on DioException catch (e) {
      return parseError(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<BaseResponse> delete(
    String endpoints, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final Response response = await _dio.delete(
        endpoints,
        data: body == null ? null : jsonEncode(body),
        options: Options(headers: headers),
      );
      return parseResponse(response);
    } on DioException catch (e) {
      return parseError(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<BaseResponse> get(
    String endpoints, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final Response response = await _dio.get(
        endpoints,
        data: body == null ? null : jsonEncode(body),
        queryParameters: queryParams,
        options: Options(headers: headers),
      );
      return parseResponse(response);
    } on DioException catch (e) {
      return parseError(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<BaseResponse> formData(
    String url,
    UploadFormDataModel uploadFormData,
  ) async {
    try {
      FormData formData = FormData.fromMap({
        uploadFormData.fileKey: MultipartFile.fromBytes(
          uploadFormData.fileBytes,
          filename: uploadFormData.fileName,
          contentType: uploadFormData.contentType,
        ),
        ...uploadFormData.data,
      });

      final Map<String, dynamic> headers = {
        'Content-Type': 'multipart/form-data'
      };

      final Response response = await _dio.post(
        url,
        data: formData,
        options: Options(
          headers: headers,
        ),
      );
      return parseResponse(response);
    } on DioException catch (e) {
      return parseError(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<BaseResponse> downloadFile(
    DownloadFileModel downloadFile,
  ) async {
    try {
      String path = await _getFilePath(downloadFile.fileNameWithExt);
      final Response response = await _dio.download(
        downloadFile.fullFileUrl,
        path,
        onReceiveProgress: (receivedBytes, totalBytes) {
          if (totalBytes <= 0) return;
          final percentage =
              (receivedBytes / totalBytes * 100).toStringAsFixed(0);
          final progress = receivedBytes / totalBytes;
          final DownloadProgress downloadProgress = DownloadProgress(
            percentage: percentage,
            progress: progress,
            receivedBytes: receivedBytes,
            totalBytes: totalBytes,
          );
          downloadFile.downloadProgress(downloadProgress);
        },
      );
      return parseResponse(response);
    } on DioException catch (e) {
      return parseError(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> _getFilePath(String filename) async {
    Directory? dir;

    try {
      if (Platform.isIOS) {
        dir = await getApplicationDocumentsDirectory(); // for iOS
      } else {
        dir = Directory('/storage/emulated/0/Download/'); // for android
        if (!await dir.exists()) dir = (await getExternalStorageDirectory())!;
      }
    } catch (err) {
      debugPrint("Cannot get download folder path $err");
    }
    return "${dir?.path}$filename";
  }
}
