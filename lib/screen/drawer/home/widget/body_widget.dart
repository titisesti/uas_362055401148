import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class body_widget extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<body_widget> {
  String activeCase = 'null';
  String deathCase = 'null';
  String tanggal = 'null';

  Future _getData() async {
    try {
      final response = await http
          .get(Uri.parse("https://data.covid19.go.id/public/api/update.json"));

      // untuk cek data
      if (response.statusCode == 200) {
        print(response.body);
        final data = json.decode(response.body);

        setState(() {
          tanggal = data['update']['penambahan']['tanggal'];
          activeCase =
              data['update']['penambahan']['jumlah_positif'].toString();
          deathCase =
              data['update']['penambahan']['jumlah_meninggal'].toString();
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    double _containerBodyHeight = MediaQuery.of(context).size.height * 0.54;
    double _itemHeight = _containerBodyHeight * 0.42;

    return Container(
      height: _containerBodyHeight,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
      decoration: BoxDecoration(
          color: Colors.grey[350], borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Container(
            height: _itemHeight,
            width: double.infinity,
            padding: EdgeInsets.all(17),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 239, 255, 251),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Text(
                        "CURRENT STATS TODAY  ",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Image.asset("assets/images/polygon.png"),
                      // Text('jgvg'),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        tanggal,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "REPORTED CASES",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                          Image.asset("assets/images/virus.png"),
                          Text(
                            activeCase,
                            style: TextStyle(fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "REPORTED DEATHS",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                          Image.asset("assets/images/poison.png"),
                          Text(
                            deathCase,
                            style: TextStyle(fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    )
                  ],
                ))
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: _itemHeight,
            width: double.infinity,
            padding: EdgeInsets.all(17),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 239, 255, 251),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Corona Virus Measures To Take",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: Text(
                    "Stay aware of the latest measures to prevent COVID-19 outbreak",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 15),
                          decoration: BoxDecoration(
                              color: Colors.grey[350],
                              borderRadius: BorderRadius.circular(5)),
                          child: Image.asset("assets/images/facemask.png")),
                      SizedBox(
                        width: 25,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Wear a facemask',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Container(
                                      padding:
                                          EdgeInsets.only(left: 5, right: 5),
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: Colors.lightBlue[200],
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: Center(
                                        child: Text(
                                          'See more ->',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                            Text(
                              "You should always wear a facemask when you are around other people.",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 12),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
