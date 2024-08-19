import 'package:flutter/services.dart';

class ApiService {
  static Future<String> getTweets() async {
    return await rootBundle.loadString('lib/assets/tweets_data.json');
  }

  static Future<String> getTrends() async {
    return await rootBundle.loadString('lib/assets/trends_data.json');
  }
}
