import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/api_service.dart';
import 'package:twitter/models/tweet.dart';
import 'package:twitter/responsive.dart';
import 'package:twitter/utils.dart';

const BorderSide _borderSide =
    BorderSide(color: Color.fromRGBO(47, 51, 54, 1), width: 1);

Widget getTopPart() {
  return Row(
    children: [
      Expanded(
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  overlayColor: Colors.white,
                  shape: const RoundedRectangleBorder()),
              child: const DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 4,
                              color: Color.fromRGBO(29, 155, 240, 1)))),
                  child: Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      child: Text("For you"))))),
      Expanded(
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: const Color.fromRGBO(113, 118, 123, 1),
                  overlayColor: Colors.white,
                  shape: const RoundedRectangleBorder()),
              child: const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Text("Following")))),
    ],
  );
}

Widget getNewTweetPart() {
  return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: _borderSide, top: _borderSide)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "lib/assets/profile-pic.jpg",
              height: 40,
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                    height: 50,
                    child: Text(
                      "What is happening?!",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(113, 118, 123, 1)),
                    )),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                          width: 180,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.photo_outlined,
                                color: Color.fromRGBO(29, 155, 240, 1),
                              ),
                              Icon(
                                Icons.gif_box_outlined,
                                color: Color.fromRGBO(29, 155, 240, 1),
                              ),
                              Icon(
                                Icons.mediation_rounded,
                                color: Color.fromRGBO(29, 155, 240, 1),
                              ),
                              Icon(
                                Icons.emoji_emotions_outlined,
                                color: Color.fromRGBO(29, 155, 240, 1),
                              ),
                              Icon(
                                Icons.calendar_today_outlined,
                                color: Color.fromRGBO(29, 155, 240, 1),
                              ),
                              Icon(
                                Icons.location_on_outlined,
                                color: Color.fromRGBO(29, 155, 240, 1),
                              )
                            ],
                          )),
                      Container(
                        width: 566 / 2,
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 14, 83, 129),
                            foregroundColor:
                                const Color.fromRGBO(92, 92, 92, 1),
                          ),
                          child: const Text(
                            "Post",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ])
              ],
            )
          ],
        ),
      ));
}

Widget getNewPostsCountSection() {
  return DecoratedBox(
      decoration: const BoxDecoration(border: Border(bottom: _borderSide)),
      child: Padding(
          padding: const EdgeInsets.only(bottom: 10, top: 10),
          child: Center(
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      overlayColor: Colors.white),
                  child: const Text(
                    "Show 210 posts",
                    style: TextStyle(color: Color.fromRGBO(29, 155, 240, 1)),
                  )))));
}

String getTimeAgo(DateTime timeNow, DateTime tweetTime) {
  Duration timeDiff = timeNow.difference(tweetTime);
  if (timeDiff < const Duration(days: 1)) {
    if (timeDiff < const Duration(hours: 1)) {
      return "${timeDiff.inMinutes}m";
    }
    return "${timeDiff.inHours}h";
  }
  return "${timeDiff.inDays}d";
}

DateTime getTweetTime(String tweetTime) {
  return DateTime.parse(tweetTime);
}

Widget getTweetsSection(List<Tweet> tweets) {
  if (tweets.isEmpty) {
    return const Padding(
        padding: EdgeInsets.all(20),
        child: Center(
            child: CircularProgressIndicator(
          color: Color.fromRGBO(29, 155, 240, 1),
        )));
  }
  List<Widget> tweetWidgets = [];
  DateTime timeNow = DateTime.now(); // TODO: should be UTC
  Color greyTextColor = const Color.fromARGB(255, 124, 124, 124);

  for (var tweet in tweets) {
    DateTime tweetTime = getTweetTime(tweet.timePosted);
    String timeAgo = getTimeAgo(timeNow, tweetTime);
    tweetWidgets.add(DecoratedBox(
        decoration: const BoxDecoration(border: Border(bottom: _borderSide)),
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.network(
                tweet.profilePhotoUrl,
                width: 40,
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                color: Colors.green,
                height: 10,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              backgroundColor: Colors.black,
                              overlayColor: Colors.black,
                              foregroundColor: Colors.white),
                          child: Row(children: [
                            Text(tweet.name),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "@${tweet.username} - $timeAgo",
                              style: TextStyle(color: greyTextColor),
                            )
                          ]),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.more_horiz_outlined))
                      ],
                    ),
                    Text(tweet.message),
                    if (tweet.photoPath != null)
                      const SizedBox(
                        height: 10,
                      ),
                    if (tweet.photoPath != null)
                      ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: Image.asset(tweet.photoPath!)),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Row(children: [
                          Icon(
                            Icons.chat_bubble_outline,
                            color: greyTextColor,
                          ),
                          Text(
                            tweet.comments.toString(),
                            style: TextStyle(color: greyTextColor),
                          )
                        ])),
                        Expanded(
                            child: Row(children: [
                          FaIcon(
                            FontAwesomeIcons.retweet,
                            color: greyTextColor,
                          ),
                          Text(
                            tweet.retweets.toString(),
                            style: TextStyle(color: greyTextColor),
                          )
                        ])),
                        Expanded(
                            child: Row(children: [
                          Icon(
                            Icons.favorite_border_outlined,
                            color: greyTextColor,
                          ),
                          Text(
                            tweet.likes.toString(),
                            style: TextStyle(color: greyTextColor),
                          )
                        ])),
                        Expanded(
                            child: Row(children: [
                          Icon(
                            Icons.bar_chart_outlined,
                            color: greyTextColor,
                          ),
                          Text(
                            getCountSummaryText(tweet.views),
                            style: TextStyle(color: greyTextColor),
                          )
                        ])),
                        Expanded(
                            child: Row(children: [
                          Icon(
                            Icons.bookmark_border_outlined,
                            color: greyTextColor,
                          ),
                          Icon(
                            Icons.upload_outlined,
                            color: greyTextColor,
                          ),
                        ])),
                      ],
                    )
                  ],
                ),
              ),
            ]))));
  }
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    mainAxisAlignment: MainAxisAlignment.start,
    children: tweetWidgets,
  );
}

class FeedState extends State {
  List<Tweet> tweets = [];
  bool apiCallDone = false;

  void getTweets() async {
    List<Tweet> apiTweets = [];
    ApiService.getTweets().then((String value) {
      List jsonData = jsonDecode(value);

      for (var jsonValue in jsonData) {
        apiTweets.add(Tweet.fromJson(jsonValue));
      }
      Future.delayed(const Duration(seconds: 0), () {
        // TODO: delay by 2 seconds to emulate API
        // Delay a bit to enjoy the loading widget
        setState(() {
          tweets = apiTweets;
          apiCallDone = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!apiCallDone) {
      getTweets();
    }
    return Container(
        width: 566,
        margin: const EdgeInsets.only(
            left: 1, right: 1), // don't cover the border??
        decoration: !Responsive.isMobile(context)
            ? const BoxDecoration(
                border: Border(left: _borderSide, right: _borderSide))
            : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            getTopPart(),
            Scrollable(
              viewportBuilder: (context, position) {
                return Column(
                  children: [
                    getNewTweetPart(),
                    getNewPostsCountSection(),
                    getTweetsSection(tweets)
                  ],
                );
              },
            )
          ],
        ));
  }
}

class FeedPanel extends StatefulWidget {
  const FeedPanel({super.key});
  @override
  State<StatefulWidget> createState() {
    return FeedState();
  }
}
