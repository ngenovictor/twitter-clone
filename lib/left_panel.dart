import 'package:flutter/material.dart';

class LeftPanel extends StatelessWidget {
  final ButtonStyle _buttonStyle = ButtonStyle(
    foregroundColor: WidgetStateColor.resolveWith((Set<WidgetState> _) {
      return Colors.white;
    }),
  );
  final TextStyle _textStyle = const TextStyle(fontSize: 20);
  final SizedBox _spaceBetween = const SizedBox(
    height: 20,
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

  LeftPanel({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> panelIcons = [];
    _iconElements.forEach(
      (String iconText, IconData icon) {
        panelIcons.add(Container(
            child: ElevatedButton.icon(
          onPressed: null,
          icon: Icon(icon),
          label: Text(
            iconText,
            style: _textStyle,
          ),
          style: _buttonStyle,
        )));
        panelIcons.add(_spaceBetween);
      },
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
            const Image(
              image: AssetImage("lib/assets/logo-white.png"),
              height: 50,
            ),
            _spaceBetween
          ] +
          panelIcons +
          [
            ElevatedButton(
              onPressed: null,
              style: _buttonStyle,
              child: const Text("Post"),
            )
          ],
    );
  }
}
