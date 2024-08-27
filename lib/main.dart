import 'package:flutter/material.dart';
import 'package:twitter/constants/colors.dart';
import 'package:twitter/feed_panel.dart';
import 'package:twitter/left_panel.dart';
import 'package:twitter/responsive.dart';
import 'package:twitter/right_panel.dart';

void main() {
  runApp(const Twitter());
}

class Twitter extends StatelessWidget {
  const Twitter({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: const TextTheme(bodySmall: TextStyle(color: Colors.white)),
        fontFamily: "Roboto",
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Twitter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.black,
        child: DefaultTextStyle(
          style: const TextStyle(color: Colors.white),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              LeftPanel(),
            ],
          ),
        ));
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: Responsive.isMobile(context) ? const HomeDrawer() : null,
      body: Container(
          width: double.infinity,
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DefaultTextStyle(
              style: const TextStyle(color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // mobile limit width to min360px
                  if (Responsive.isMobile(context))
                    SizedBox(
                        width: MediaQuery.of(context).size.width < 360
                            ? 360
                            : MediaQuery.of(context).size.width,
                        child: const FeedPanel()),

                  // tablet
                  if (Responsive.isTablet(context))
                    SizedBox(width: 150, child: LeftPanel()),
                  if (Responsive.isTablet(context))
                    const SizedBox(width: 500, child: FeedPanel()),
                  // desktop
                  if (Responsive.isDesktop(context))
                    SizedBox(width: 316, child: LeftPanel()),
                  if (Responsive.isDesktop(context))
                    const SizedBox(width: 566, child: FeedPanel()),
                  if (Responsive.isDesktop(context))
                    const SizedBox(width: 316, child: RightPanel()),
                ],
              ), // This trailing comma makes auto-formatting nicer for build methods.
            ),
          )),
      bottomNavigationBar: Responsive.isMobile(context)
          ? Theme(
              data: Theme.of(context).copyWith(canvasColor: Colors.black),
              child: BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home_outlined,
                      ),
                      label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search), label: "Explore"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.crop_square_outlined), label: "Grok"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.notifications_none_rounded),
                      label: "Notifications"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.mail_outline), label: "Messages"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.people_alt_outlined), label: "Profile"),
                ],
                showSelectedLabels: false,
                iconSize: 30,
              ),
            )
          : null,
      floatingActionButton: Responsive.isMobile(context)
          ? SizedBox(
              width: 50,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColors.twitterBrightBlue,
                    foregroundColor: Colors.white, // for
                    padding: const EdgeInsets.only()),
                child: const Icon(Icons.chat),
              ),
            )
          : null,
    );
  }
}
