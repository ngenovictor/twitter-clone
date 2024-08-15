import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:twitter/api_service.dart';
import 'package:twitter/models/tweet.dart';

const BorderSide _borderSide =
    BorderSide(color: Color.fromRGBO(47, 51, 54, 1), width: 1);

Widget getTopPart() {
  return Container(
      decoration: const BoxDecoration(
          border: Border(
              bottom: _borderSide, left: _borderSide, right: _borderSide)),
      child: SizedBox(
        height: 50,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  fixedSize: const Size((566 / 2) - 1, 25),
                  shape: const LinearBorder()),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "For you",
                  ),
                  Container(
                    width: 50,
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 5,
                                color: Color.fromRGBO(29, 155, 240, 1))),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  )
                ],
              )),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              fixedSize: const Size((566 / 2) - 1, 25),
              shape: const LinearBorder(),
            ),
            child: const Text(
              "Following",
              style: TextStyle(
                color: Color.fromRGBO(113, 118, 123, 1),
              ),
            ),
          )
        ]),
      ));
}

Widget getNewTweetPart() {
  return Container(
      decoration: const BoxDecoration(
          border: Border(
              bottom: _borderSide, left: _borderSide, right: _borderSide)),
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
                                const Color.fromRGBO(29, 155, 240, 1),
                            foregroundColor:
                                const Color.fromRGBO(92, 92, 92, 1),
                          ),
                          child: const Text(
                            "Post",
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
      decoration: const BoxDecoration(
          border: Border(
              left: _borderSide, right: _borderSide, bottom: _borderSide)),
      child: Padding(
          padding: const EdgeInsets.only(bottom: 10, top: 10),
          child: Center(
              child: ElevatedButton(
                  onPressed: () {},
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: const Text(
                    "Show 210 posts",
                    style: TextStyle(color: Color.fromRGBO(29, 155, 240, 1)),
                  )))));
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
  return Text("tweets");
}

class FeedState extends State {
  List<Tweet> tweets = [];
  bool apiCallDone = false;

  void getTweets() async {
    List<Tweet> apiTweets = [];
    ApiService.readJson().then((String value) {
      List jsonData = jsonDecode(value);

      for (var jsonValue in jsonData) {
        apiTweets.add(Tweet.fromJson(jsonValue));
      }
      Future.delayed(const Duration(seconds: 2), () {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getTopPart(),
        getNewTweetPart(),
        getNewPostsCountSection(),
        getTweetsSection(tweets)
      ],
    );
  }
}

class FeedPanel extends StatefulWidget {
  const FeedPanel({super.key});
  @override
  State<StatefulWidget> createState() {
    return FeedState();
  }
}
