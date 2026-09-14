import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends ValueNotifier<bool> {
  AuthController._() : super(false);

  static final AuthController instance = AuthController._();

  // tersimpan di dalam local storage
  static const  _prefsKey = 'flowee_is_logged_in';

  // dipanggil sekali saat aplikasi baru dibuka (muncul splash screen),
  // untuk membaca status login yg tersimpan dari sesi SEBELUMNYA
  Future<void> loadPersistedSession() async {
    final prefs = await SharedPreferences.getInstance();
    value = prefs.getBool(_prefsKey) ?? false;
  }

  // SharedPreferences untuk menyimpan data ke localStorage
  Future<void> login() async {
    value = true;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefsKey, true);

  }

  Future<void> logout() async {
    value = false;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefsKey, false);
  }
}