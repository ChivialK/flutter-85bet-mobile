import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

/// File Reader for CI/CD to get necessary data from .json file in config folder
///
/// Note: Write the script on CI/CD site to create .json file on virtual machine
/// since the config folder should not be uploaded. Read the [readme] file in
/// config folder for more information.
///
/// TODO use config class to set the service url??
abstract class ConfigReader {
  static Map<String, dynamic> _config;

  static Future<void> initialize() async {
    final configString = await rootBundle.loadString('config/app_config.json');
    _config = json.decode(configString) as Map<String, dynamic>;
  }

  static String getVersion() {
    return _config['version'] as String;
  }

  static String getSecretKey() {
    return _config['secretKey'] as String;
  }
}
