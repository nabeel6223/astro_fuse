import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart'; // for date format
// import 'package:intl/date_symbol_data_local.dart';

Future<Map<String, dynamic>> fetchBlogs() async {
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

class blogList extends StatefulWidget {
  blogList({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _blogList();
  }
}

class _blogList extends State<blogList> {
  final Future<Map<String, dynamic>> blogs = fetchBlogs();

  // blogList({super.key});
  // final List<int> lst = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 220,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Latest from blog",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  "View All",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFa0a0a0)),
                )
              ],
            ),
          ),
          FutureBuilder<Map<String, dynamic>>(
              future: blogs,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(16, 16, 0, 16),
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              width: 200,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(12, 9, 30, 37),
                                      blurRadius: 20.0, // soften the shadow
                                      spreadRadius: 0, //extend the shadow
                                      offset: Offset(
                                        0, // Move to right 5  horizontally
                                        8.0, // Move to bottom 5 Vertically
                                      ),
                                    )
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255))),
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Stack(
                                  children: [
                                    Column(
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 100,
                                                width: 196,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.network(
                                                      "https://astro.diploy.in/" +
                                                          snapshot.data!["blog"]
                                                                  [index]
                                                              ["previewImage"],
                                                      fit: BoxFit.cover
                                                      // width: double.infinity,
                                                      // height: double.infinity,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(4, 8, 4, 8),
                                          child: Text(
                                              snapshot.data!["blog"][index]
                                                  ["title"],
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(4, 8, 4, 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  snapshot.data!["blog"][index]
                                                      ["author"],
                                                  style: TextStyle(
                                                      color: Color(0xFFa0a0a0),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              Text(
                                                  DateFormat.yMMMMd().format(
                                                      DateTime.parse(
                                                          snapshot.data!["blog"]
                                                                  [index]
                                                              ["created_at"])),
                                                  style: TextStyle(
                                                      color: Color(0xFFa0a0a0),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600))
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 8, 8, 0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.white
                                                    .withOpacity(0.5)),
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  4, 4, 4, 4),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.remove_red_eye,
                                                    size: 20,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 4),
                                                    child: Text(
                                                        snapshot.data!["blog"]
                                                                [index]
                                                                ["viewer"]
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: snapshot.data!["blog"].length,
                      ),
                    ),
                  );
                }
                return Text("Error");
              })
        ],
      ),
    );
  }
}
