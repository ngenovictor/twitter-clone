import 'package:flutter/services.dart';

class ApiService {
  Future<String> readJson() async {
    return await rootBundle.loadString('lib/assets/data.json');
  }
}
