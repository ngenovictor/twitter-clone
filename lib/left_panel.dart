import 'package:flutter/material.dart';

class LeftPanel extends StatelessWidget {
  final ButtonStyle _buttonStyle = ButtonStyle(
  foregroundColor: WidgetStateColor.resolveWith((Set<WidgetState> _) {
    return Colors.white;
  }),

  );
  LeftPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage("lib/assets/logo-white.png"),
          height: 50,
        ),
        Container(child: ElevatedButton.icon(onPressed: null, icon:Icon(Icons.home), label: Text("Home"), style: _buttonStyle,)),
        Container(child: ElevatedButton.icon(onPressed: null, icon:Icon(Icons.search), label: Text("Explore"), style: _buttonStyle,)),
        Container(child: ElevatedButton.icon(onPressed: null, icon:Icon(Icons.blender_outlined), label: Text("Notifications"), style: _buttonStyle,)),
        Container(child: ElevatedButton.icon(onPressed: null, icon:Icon(Icons.message), label: Text("Messages"), style: _buttonStyle,)),
        Container(child: ElevatedButton.icon(onPressed: null, icon:Icon(Icons.home), label: Text("Grok"), style: _buttonStyle,)),
        Container(child: ElevatedButton.icon(onPressed: null, icon:Icon(Icons.chrome_reader_mode_outlined), label: Text("Lists"), style: _buttonStyle,)),
        Container(child: ElevatedButton.icon(onPressed: null, icon:Icon(Icons.bookmark), label: Text("Bookmarks"), style: _buttonStyle,)),
        Container(child: ElevatedButton.icon(onPressed: null, icon:Icon(Icons.people), label: Text("Communities"), style: _buttonStyle,)),
        Container(child: ElevatedButton.icon(onPressed: null, icon:Icon(Icons.flash_on), label: Text("Premium"), style: _buttonStyle,)),
        Container(child: ElevatedButton.icon(onPressed: null, icon:Icon(Icons.flash_on), label: Text("verified Orgs"), style: _buttonStyle,)),
        Container(child: ElevatedButton.icon(onPressed: null, icon:Icon(Icons.person_outline), label: Text("Profile"), style: _buttonStyle,)),
        Container(child: ElevatedButton.icon(onPressed: null, icon:Icon(Icons.more_horiz), label: Text("More"), style: _buttonStyle,)),
        ElevatedButton(onPressed: null, child: Text("Post"), style: _buttonStyle,)
      ],
    );
  }
}
