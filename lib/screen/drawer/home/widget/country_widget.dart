import 'dart:core';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CountryWidget extends StatefulWidget {
  int index;
  CountryWidget({required this.index});
  @override
  _CountryWidgetState createState() => _CountryWidgetState(index: index);
}

class _CountryWidgetState extends State<CountryWidget> {
  String key = 'null';
  String jKasus = 'null';
  String jDeath = 'null';
  int index;
  _CountryWidgetState({required this.index});

  Future _getData() async {
    try {
      final response = await http
          .get(Uri.parse("https://data.covid19.go.id/public/api/prov.json"));
      if (response.statusCode == 200) {
        print(response.body);
        final data = json.decode(response.body);

        setState(() {
          key = data['list_data'][index]['key'];
          jKasus = data['list_data'][index]['jumlah_kasus'].toString();
          jDeath = data['list_data'][index]['jumlah_meninggal'].toString();
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
    return Container(
        height: 150,
        width: MediaQuery.of(context).size.width - 20,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 185, 221, 250),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  "assets/images/peta_jawa_timur.png",
                  height: 130,
                  width: 130,
                )),
            SizedBox(width: 15),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          key,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Image.asset("assets/images/jawa_timur.png",
                            height: 45, width: 45)
                      ],
                    ),
                    Text(
                      '- ' + '$jKasus' + " infected cases reported",
                      style: TextStyle(color: Colors.black87, fontSize: 13),
                    ),
                    Text(
                      '- ' + '$jDeath' + " death cases reported",
                      style: TextStyle(color: Colors.black87, fontSize: 13),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
