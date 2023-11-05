import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchRes() async {
  final res =
      await http.post(Uri.parse('https://astro.diploy.in/api/getCustomerHome'));
  // print(jsonDecode(res.body));
  final json = jsonDecode(res.body) as Map<String, dynamic>;
  // return Album.fromJson(json);
  // Future<List<dynamic>> lst = json["banner"];
  // Future<List<String>> req;
  // return json["banner"];

  return json;
}

class carousels extends StatefulWidget {
  carousels({super.key});

  @override
  State<carousels> createState() {
    return _carouselsState();
  }
}

class _carouselsState extends State<carousels> {
  final CarouselController _controller = CarouselController();
  int _current = 0;
  // const carousels({super.key});
  // List<String> banners = fetchRes().map({})
  // Map<String, dynamic> map=fetchRes();
  // fectRes().forEach((k, v) => list.add(Customer(k, v)));
  final Future<Map<String, dynamic>> imgList = fetchRes();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: FutureBuilder<Map<String, dynamic>>(
          future: imgList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                width: double.infinity,
                height: 200,
                child: Column(children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: CarouselSlider(
                        items: snapshot.data!["banner"]
                            .map<Widget>((item) => Container(
                                  child: Center(
                                      child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      // ignore: prefer_interpolation_to_compose_strings
                                      "https://astro.diploy.in/" +
                                          item["bannerImage"],

                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                                  )),
                                ))
                            .toList(),
                        carouselController: _controller,
                        options: CarouselOptions(
                            height: double.infinity,
                            autoPlay: true,
                            viewportFraction: 1,
                            // enlargeCenterPage: true,
                            // aspectRatio: 2.0,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: snapshot.data!["banner"]
                        .asMap()
                        .entries
                        .map<Widget>((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Color.fromARGB(255, 223, 92, 4))
                                  .withOpacity(
                                      _current == entry.key ? 0.9 : 0.1)),
                        ),
                      );
                    }).toList(),
                  ),
                ]),
              );
            }
            return Text("${snapshot.error}");
          }),
    );
  }
}
