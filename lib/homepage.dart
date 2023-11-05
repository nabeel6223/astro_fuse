import 'dart:convert';

import 'package:astro_fuse/astrologersList.dart';
import 'package:astro_fuse/blogList.dart';
import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:astro_fuse/carousels.dart';

class homePage extends StatefulWidget {
  homePage({super.key});

  @override
  State<homePage> createState() {
    return _homePageState();
  }
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: carousels(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: astroList(),
                  ),
                  blogList(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 4),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.orange),
                    onPressed: () {},
                    child: const Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.sms_rounded,
                            size: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Text(
                              "Chat with Astrologers",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.orange),
                    onPressed: () {},
                    child: const Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.call,
                            size: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Text(
                              "Call with Astrologers",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
