import 'package:flutter/services.dart';

class ApiService {
  static Future<String> readJson() async {
    return await rootBundle.loadString('lib/assets/data.json');
  }
}
