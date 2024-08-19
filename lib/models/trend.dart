class Trend {
  int rank;
  String topic;
  int tweets;

  Trend.fromJson(Map<String, dynamic> json)
      : rank = json["rank"],
        topic = json['topic'],
        tweets = json['tweets'];
}
