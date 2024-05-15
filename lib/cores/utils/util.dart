import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sipaias_fun_mobile/features/auth/presentation/view/login_view.dart';

part 'screen.dart';

part 'logger.dart';

part 'routes.dart';

part 'preferences.dart';

part 'json.dart';

part 'upload.dart';

class UtilGlobal {
  static late LogUtils log;
  static late BuildContext context;
  static late PreferencesUtils preferences;

  static Future<void> init() async {
    UtilGlobal.log = LogUtils();
    SharedPreferences pref = await SharedPreferences.getInstance();
    preferences = PreferencesUtils(pref);
  }

  static void setContext(BuildContext context) {
    UtilGlobal.context = context;
  }
}

var log = UtilGlobal.log;
var pref = UtilGlobal.preferences.sharedPreferences;
var prefTool = UtilGlobal.preferences;
