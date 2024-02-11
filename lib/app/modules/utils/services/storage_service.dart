import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../constants/storage_key.dart';
import '../models/models.dart';

class StorageService {
  late GetStorage _storage;

  /// private constructor
  StorageService._() {
    init();
  }

  /// the one and only instance of this singleton
  static final instance = StorageService._();

  void init() {
    _storage = GetStorage();
  }

  Future<bool> save(StorageKeys keys, String data) async {
    try {
      await _storage.write(keys.value, data);
      return true;
    } catch (e) {
      debugPrint('error when save to storage $e');
      return false;
    }
  }

  Future<String?> get(StorageKeys keys) async {
    try {
      final data = await _storage.read(keys.value);
      return data;
    } catch (e) {
      debugPrint('error when get from storage $e');
      return null;
    }
  }

  Future<bool?> remove(StorageKeys keys) async {
    try {
      await _storage.remove(keys.value);
      return true;
    } catch (e) {
      debugPrint('error when delete from storage $e');
      return false;
    }
  }

  Future<void> saveUser(UserModel user) async {
    try {
      await save(StorageKeys.userKey, jsonEncode(user.toJson()));
    } catch (e) {
      debugPrint('error when save user to storage $e');
    }
  }

  Future<void> clearUser() async {
    try {
      await remove(StorageKeys.userKey);
    } catch (e) {
      debugPrint('error when remove user from storage $e');
    }
  }

  Future<UserModel?> getUser() async {
    try {
      final String? stringUser = await get(StorageKeys.userKey);
      if (stringUser == null) {
        return null;
      }

      final UserModel user = UserModel.fromJson(jsonDecode(stringUser));
      return user;
    } catch (e) {
      return null;
    }
  }
}
