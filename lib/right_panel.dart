import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:twitter/api_service.dart';
import 'package:twitter/models/trend.dart';
import 'package:twitter/utils.dart';

const BorderSide _borderSide =
    BorderSide(color: Color.fromRGBO(47, 51, 54, 1), width: 1);

class TrendsPanel extends StatefulWidget {
  const TrendsPanel({super.key});

  @override
  State createState() => TrendsPanelState();
}

class TrendsPanelState extends State {
  List<Trend> trends = [];
  bool trendsLoaded = false;
  getTrends() async {
    ApiService.getTrends().then((value) {
      for (var trend in jsonDecode(value)) {
        trends.add(Trend.fromJson(trend));
      }
      setState(() {
        trendsLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!trendsLoaded) {
      getTrends();
    }
    List<Widget> trendsWidgets = [];
    for (var trend in trends) {
      trendsWidgets.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.only(top: 20),
                  foregroundColor: const Color.fromRGBO(161, 161, 161, 1.0),
                  textStyle: const TextStyle(fontSize: 13)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${trend.rank}. Trending'),
                  const SizedBox(height: 5),
                  Text(
                    "#${trend.topic}",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  const SizedBox(height: 5),
                  Text("${getCountSummaryText(trend.tweets)} posts"),
                ],
              ),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz_outlined))
          ],
        ),
      );
      trendsWidgets.add(SizedBox(height: 10));
    }
    return SizedBox(
      child: Column(children: trendsWidgets),
    );
  }
}

class RightPanel extends StatelessWidget {
  const RightPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, top: 5),
      width: 316,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle:
                    const TextStyle(color: Color.fromRGBO(47, 51, 54, 1)),
                prefixIcon: Icon(Icons.search, color:
                    WidgetStateColor.resolveWith((Set<WidgetState> states) {
                  // TODO: not working
                  return states.contains(WidgetState.focused)
                      ? const Color.fromRGBO(29, 155, 240, 1)
                      : const Color.fromRGBO(47, 51, 54, 1);
                })),
                border: const OutlineInputBorder(
                    borderSide: _borderSide,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                enabledBorder: const OutlineInputBorder(
                    borderSide: _borderSide,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                focusedBorder: OutlineInputBorder(
                    borderSide: _borderSide.copyWith(
                        color: const Color.fromRGBO(29, 155, 240, 1)),
                    borderRadius: const BorderRadius.all(Radius.circular(50))),
              ),
            ),
            const SizedBox(height: 20),
            DecoratedBox(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromRGBO(47, 51, 54, 1), width: 1),
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Subscribe to Premium",
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 20)),
                        const SizedBox(height: 10),
                        const Text(
                            "Subscribe to unlock new features and if eligible, receive a share of ads revenue."),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 16),
                              foregroundColor: Colors.white,
                              backgroundColor:
                                  const Color.fromRGBO(29, 155, 240, 1)),
                          child: const Text("Subscribe"),
                        ),
                      ])),
            ),
            const SizedBox(height: 20),
            DecoratedBox(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromRGBO(47, 51, 54, 1), width: 1),
                  borderRadius: BorderRadius.circular(20)),
              child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Trends",
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 20)),
                        SizedBox(height: 10),
                        TrendsPanel(),
                      ])),
            ),
          ],
        ),
      ),
    );
  }
}
