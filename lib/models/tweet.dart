class Tweet {
  String message;
  String? photoPath;
  String profilePhotoUrl;
  String name;
  String username;
  String timePosted;

  Tweet.fromJson(Map<String, dynamic> json)
      : message = json["message"],
        photoPath = json['photo_path'],
        profilePhotoUrl = json['profile_photo_url'],
        name = json['name'],
        username = json['username'],
        timePosted = json['time_posted'];
}
