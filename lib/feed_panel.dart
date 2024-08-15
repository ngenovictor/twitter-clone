import 'package:flutter/material.dart';

class FeedPanel extends StatelessWidget {
  final BorderSide _borderSide =
      const BorderSide(color: Color.fromRGBO(47, 51, 54, 1), width: 1);
  const FeedPanel({super.key});
  final isHovering = false;
  @override
  Widget build(BuildContext context) {
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
}
