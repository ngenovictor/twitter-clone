import 'package:flutter/material.dart';

class FeedPanel extends StatelessWidget {
  final BorderSide _borderSide =
      const BorderSide(color: Color.fromRGBO(47, 51, 54, 1), width: 1);
  const FeedPanel({super.key});

  Widget getTopPart() {
    return Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: _borderSide, left: _borderSide, right: _borderSide)),
        child: SizedBox(
          height: 50,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
        decoration: BoxDecoration(
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [getTopPart(), getNewTweetPart()],
    );
  }
}
