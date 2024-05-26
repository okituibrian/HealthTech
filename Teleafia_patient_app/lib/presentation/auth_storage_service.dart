import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthStorageService {
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  Future<void> saveUserData(String idNumber, String email) async {
    await _secureStorage.write(key: 'idNumber', value: idNumber);
    await _secureStorage.write(key: 'email', value: email);
  }

  Future<Map<String, String?>> getUserData() async {
    String? email = await _secureStorage.read(key: 'email');
    String? idNumber = await _secureStorage.read(key: 'idNumber');
    return {'email': email, 'idNumber': idNumber};
  }

  Future<void> clearUserData() async {
    await _secureStorage.deleteAll();
  }
}
