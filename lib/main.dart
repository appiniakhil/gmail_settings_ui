import 'package:flutter/material.dart';
import 'package:gmail_settings_ui/general_settings.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<Widget> tabs = const [
    Tab(
      text: "General",
    ),
    Tab(
      text: "Labels",
    ),
    Tab(
      text: "Inbox",
    ),
    Tab(
      text: "Accounts and Import",
    ),
    Tab(
      text: "Themes",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
              title: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text("Settings"),
              ),
              bottom: TabBar(
                tabs: tabs,
                splashFactory: NoSplash.splashFactory,
              )),
          body: const TabBarView(children: [
            GeneralSettings(),
            Center(child: Text("Labels")),
            Center(child: Text("Inbox")),
            Center(child: Text("Accounts and Import")),
            Center(child: Text("Themes")),
          ]),
        ),
      ),
    );
  }
}
