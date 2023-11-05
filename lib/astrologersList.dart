import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchAstro() async {
  final res =
      await http.post(Uri.parse('https://astro.diploy.in/api/getAstrologer'));
  // print(jsonDecode(res.body));
  final json = jsonDecode(res.body) as Map<String, dynamic>;
  // return Album.fromJson(json);
  // Future<List<dynamic>> lst = json["banner"];
  // Future<List<String>> req;
  // return json["banner"];

  return json;
}

class astroList extends StatefulWidget {
  astroList({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _astroList();
  }
}

class _astroList extends State<astroList> {
  final Future<Map<String, dynamic>> astro = fetchAstro();

  // astroList({super.key});
  final List<int> lst = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 270,
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
                  "Astrologers",
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
              future: astro,
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
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 20),
                            child: Container(
                              width: 150,
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
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Color.fromARGB(
                                                        255, 194, 184, 49)),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: (snapshot.data!["recordList"]
                                                            [index]
                                                        ["profileImage"] ==
                                                    null)
                                                ? Image.network(
                                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/2048px-User-avatar.svg.png",
                                                    width: 70,
                                                    height: 70,
                                                  )
                                                : Image.network(
                                                    "https://astro.diploy.in/" +
                                                        snapshot.data![
                                                                    "recordList"]
                                                                [index]
                                                            ["profileImage"],
                                                    width: 70,
                                                    height: 70,
                                                  )),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Text(
                                            snapshot.data!["recordList"][index]
                                                ["name"],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 4.0),
                                          child: Text(
                                            "₹ ${snapshot.data!["recordList"][index]["videoCallRate"]}/min",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                                    OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        foregroundColor: Colors.green,
                                        side: BorderSide(
                                            width: 1.0, color: Colors.green),
                                      ),
                                      onPressed: () {},
                                      child: Text("Connect"),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: snapshot.data!["recordList"].length,
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
