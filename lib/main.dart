import 'package:astro_fuse/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: GoogleFonts.roboto().fontFamily,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "AstroFuse",
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.wallet,
                color: Colors.black,
              ),
              tooltip: 'Wallet Icon',
              onPressed: () {},
            ), //IconButton
            IconButton(
              icon: const Icon(
                Icons.language,
                color: Colors.black,
              ),
              tooltip: 'Language Icon',
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.support_agent_outlined,
                color: Colors.black,
              ),
              tooltip: 'Language Icon',
              onPressed: () {},
            ), //IconButton
          ],
          backgroundColor: Colors.white,
          elevation: 2.0,
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            tooltip: 'Menu Icon',
            onPressed: () {},
          ),
        ),
        body: homePage(),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: 0,
            selectedItemColor: Colors.black,
            unselectedItemColor: Color(0xFFa0a0a0),
            showUnselectedLabels: true,
            // iconSize: 20,
            // icon: const SizedBox.shrink(),
            selectedFontSize: 12,
            unselectedFontSize: 12,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                  // title: Text('Home'),
                  backgroundColor: Color.fromARGB(255, 255, 255, 255)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.chat),
                  label: "Chat",
                  // title: Text('Home'),
                  backgroundColor: Color.fromARGB(255, 255, 255, 255)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.live_tv_outlined),
                  label: "Live",
                  // title: Text('Home'),
                  backgroundColor: Color.fromARGB(255, 255, 255, 255)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.call),
                  label: "Call",
                  // title: Text('Home'),
                  backgroundColor: Color.fromARGB(255, 255, 255, 255)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.history),
                  label: "History",
                  // title: Text('Home'),
                  backgroundColor: Color.fromARGB(255, 255, 255, 255))
            ]),
      ),
    );
  }
}
