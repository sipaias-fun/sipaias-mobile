import 'package:get_storage/get_storage.dart';

class StorageReferences {
  static final box = GetStorage();

  static String getAuthToken() {
    String? storedAuthData = box.read('authToken');
    return storedAuthData ?? '';
  }
}
