import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveUtils {
  static createAppStorageDirectory() async {
    final String storagePath = await _getAppStorageDirectory();
    final directory = Directory(storagePath);
    if (!directory.existsSync()) {
      directory.createSync();
    }
  }

  static _getAppStorageDirectory() async {
    final String storagePath = '${(await getApplicationDocumentsDirectory()).path}/VHR_APP_DB';
    return storagePath;
  }

  static Future<Box> openBox({required String boxName}) async {
    final String appStorageDirectory = await _getAppStorageDirectory();
    final String storagePath = <String>{appStorageDirectory, boxName}.join(Platform.pathSeparator);
    Hive.init(storagePath);
    return Hive.openBox(boxName);
  }
}
