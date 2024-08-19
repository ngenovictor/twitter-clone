import 'package:flutter/material.dart';
import 'package:twitter/responsive.dart';

class LeftPanel extends StatelessWidget {
  final SizedBox _spaceBetween = const SizedBox(
    height: 10,
  );
  final Map<String, IconData> _iconElements = {
    "Home": Icons.home,
    "Explore": Icons.search,
    "Notifications": Icons.blender_outlined,
    "Messages": Icons.message,
    "Grok": Icons.home,
    "Lists": Icons.chrome_reader_mode_outlined,
    "Bookmarks": Icons.bookmark,
    "Communities": Icons.people,
    "Premium": Icons.flash_on,
    "verified Orgs": Icons.flash_on,
    "Profile": Icons.person_outline,
    "More": Icons.more_horiz
  };
  bool isDrawerItems;

  LeftPanel({super.key, this.isDrawerItems = false});

  @override
  Widget build(BuildContext context) {
    List<Widget> panelIcons = [];
    _iconElements.forEach(
      (String iconText, IconData icon) {
        panelIcons.add(
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                overlayColor: const Color.fromARGB(255, 238, 238, 238),
                padding: const EdgeInsets.all(20)),
            child: Row(
              children: [
                Icon(icon),
                const SizedBox(
                  width: 10,
                ),
                if (isDrawerItems || Responsive.isDesktop(context))
                  Text(
                    iconText,
                    style: const TextStyle(fontSize: 20),
                  )
              ],
            ),
          ),
        );
        panelIcons.add(_spaceBetween);
      },
    );

    return Padding(
        padding: const EdgeInsets.only(right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                const Image(
                  image: AssetImage("lib/assets/logo-white.png"),
                  height: 50,
                ),
                _spaceBetween,
              ] +
              panelIcons +
              [
                _spaceBetween,
                if (Responsive.isMobile(context) ||
                    Responsive.isDesktop(context))
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(29, 155, 240, 1),
                        foregroundColor: Colors.white, // for
                        padding: const EdgeInsets.only(
                            left: 100, top: 20, right: 100, bottom: 20)),
                    child: const Text(
                      "Post",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                    ),
                  ),
                if (Responsive.isTablet(context))
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(29, 155, 240, 1),
                        foregroundColor: Colors.white, // for
                        padding: const EdgeInsets.only(top: 20, bottom: 20)),
                    child: const Icon(Icons.chat),
                  )
              ],
        ));
  }
}
