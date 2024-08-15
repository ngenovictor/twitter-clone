class Tweet {
  String message;

  Tweet.fromJson(Map<String, dynamic> json) : message = json["message"];
}
