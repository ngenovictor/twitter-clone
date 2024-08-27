import 'package:flutter/material.dart';
import 'package:twitter/constants/colors.dart';
import 'package:twitter/responsive.dart';

class LeftPanel extends StatelessWidget {
  LeftPanel({super.key});

  Map<String, IconData> getIconElements(BuildContext context) {
    if (!Responsive.isMobile(context)) {
      return {
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
    } else {
      return {
        "Profile": Icons.person_outline,
        "Premium": Icons.flash_on,
        "Lists": Icons.chrome_reader_mode_outlined,
        "Bookmarks": Icons.bookmark,
        "verified Orgs": Icons.flash_on,
        "Monetization": Icons.money,
        "Ads": Icons.open_in_new,
        "Jobs": Icons.work_outline_outlined,
        "Settings and Privacy": Icons.settings_outlined,
        "Logout": Icons.logout_outlined
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> panelIcons = [];
    bool showIconText = !Responsive.isTablet(context);
    final SizedBox spaceBetween = Responsive.isMobile(context)
        ? const SizedBox()
        : const SizedBox(
            height: 10,
          );
    getIconElements(context).forEach(
      (String iconText, IconData icon) {
        panelIcons.add(
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                overlayColor: Colors.white,
                padding: showIconText
                    ? const EdgeInsets.all(20)
                    : const EdgeInsets.all(20)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: 30,
                ),
                if (showIconText)
                  const SizedBox(
                    width: 20,
                  ),
                if (showIconText)
                  Text(
                    iconText,
                    style: const TextStyle(fontSize: 20),
                  )
              ],
            ),
          ),
        );
        panelIcons.add(spaceBetween);
      },
    );

    return Container(
        margin: Responsive.isMobile(context)
            ? const EdgeInsets.only(right: 8)
            : const EdgeInsets.only(right: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  if (Responsive.isMobile(context))
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset("lib/assets/profile-pic.jpg",
                                  width: 30),
                              const Icon(
                                Icons.add_circle_outline,
                                color: Colors.white,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("Victor",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white)),
                          Text(
                            "@victor_veekay",
                            style: TextStyle(color: CustomColors.twitterGrey),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  const Text("1,206",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white)),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text("Following",
                                      style: TextStyle(
                                          color: CustomColors.twitterGrey))
                                ],
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Row(
                                children: [
                                  const Text("541",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white)),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text("Followers",
                                      style: TextStyle(
                                          color: CustomColors.twitterGrey))
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  if (!Responsive.isMobile(context))
                    const Image(
                      image: AssetImage("lib/assets/logo-white.png"),
                      width: 50,
                      height: 50,
                    ),
                  spaceBetween,
                ] +
                panelIcons +
                [
                  spaceBetween,
                  if (Responsive.isDesktop(context))
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.twitterBrightBlue,
                          foregroundColor: Colors.white, // for
                          padding: const EdgeInsets.only(
                              left: 100, top: 20, right: 100, bottom: 20)),
                      child: const Text(
                        "Post",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800),
                      ),
                    ),
                  if (Responsive.isTablet(context))
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.twitterBrightBlue,
                          foregroundColor: Colors.white, // for
                          padding: const EdgeInsets.only(top: 20, bottom: 20)),
                      child: const Icon(Icons.chat),
                    )
                ],
          ),
        ));
  }
}
