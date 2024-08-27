import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/api_service.dart';
import 'package:twitter/constants/colors.dart';
import 'package:twitter/models/tweet.dart';
import 'package:twitter/responsive.dart';
import 'package:twitter/utils.dart';

BorderSide _borderSide =
    BorderSide(color: CustomColors.twitterGrey, width: 0.5);

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
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 4,
                              color: CustomColors.twitterBrightBlue))),
                  child: const Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      child: Text("For you"))))),
      Expanded(
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: CustomColors.twitterGrey,
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
      decoration:
          BoxDecoration(border: Border(bottom: _borderSide, top: _borderSide)),
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: 50,
                      child: Text(
                        "What is happening?!",
                        style: TextStyle(
                            fontSize: 20, color: CustomColors.twitterGrey),
                      )),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.photo_outlined,
                                color: CustomColors.twitterBrightBlue,
                              ),
                              Icon(
                                Icons.gif_box_outlined,
                                color: CustomColors.twitterBrightBlue,
                              ),
                              Icon(
                                Icons.mediation_rounded,
                                color: CustomColors.twitterBrightBlue,
                              ),
                              Icon(
                                Icons.emoji_emotions_outlined,
                                color: CustomColors.twitterBrightBlue,
                              ),
                              Icon(
                                Icons.calendar_today_outlined,
                                color: CustomColors.twitterBrightBlue,
                              ),
                              Icon(
                                Icons.location_on_outlined,
                                color: CustomColors.twitterDullBlue,
                              )
                            ],
                          )),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: CustomColors.twitterDullBlue,
                              foregroundColor: CustomColors.twitterGrey,
                            ),
                            child: const Text(
                              "Post",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        ]),
                  )
                ],
              ),
            )
          ],
        ),
      ));
}

Widget getNewPostsCountSection() {
  return DecoratedBox(
      decoration: BoxDecoration(border: Border(bottom: _borderSide)),
      child: Padding(
          padding: const EdgeInsets.only(bottom: 10, top: 10),
          child: Center(
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      overlayColor: Colors.white),
                  child: Text(
                    "Show 210 posts",
                    style: TextStyle(color: CustomColors.twitterBrightBlue),
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

List<Widget> getTweetsSection(List<Tweet> tweets) {
  if (tweets.isEmpty) {
    return [
      Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
              child: CircularProgressIndicator(
            color: CustomColors.twitterBrightBlue,
          )))
    ];
  }
  List<Widget> tweetWidgets = [];
  DateTime timeNow = DateTime.now(); // TODO: should be UTC
  Color greyTextColor = CustomColors.twitterGrey;

  for (var tweet in tweets) {
    DateTime tweetTime = getTweetTime(tweet.timePosted);
    String timeAgo = getTimeAgo(timeNow, tweetTime);
    tweetWidgets.add(DecoratedBox(
        decoration: BoxDecoration(border: Border(bottom: _borderSide)),
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
                          if (tweet.comments > 0)
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
                          if (tweet.retweets > 0)
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
                          if (tweet.likes > 0)
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
                          if (tweet.views > 0)
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
  return tweetWidgets;
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
    List<Widget> scrollableWIdgets = [
          if (!Responsive.isMobile(context)) getNewTweetPart(),
          getNewPostsCountSection(),
        ] +
        getTweetsSection(tweets);
    return Container(
        width: 566,
        margin: const EdgeInsets.only(
            left: 1, right: 1), // don't cover the border??
        decoration: !Responsive.isMobile(context)
            ? BoxDecoration(
                border: Border(left: _borderSide, right: _borderSide))
            : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            if (Responsive.isMobile(context))
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          "lib/assets/profile-pic.jpg",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          "lib/assets/logo-white.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Get Premium",
                          style: TextStyle(
                              color: CustomColors.twitterBrightBlue,
                              fontWeight: FontWeight.w800),
                        ))
                  ],
                ),
              ),
            getTopPart(),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: scrollableWIdgets,
              ),
            ))
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
