import 'package:flutter/material.dart';

class Title_widget extends StatelessWidget {
  const Title_widget({required this.globalKey});
  final GlobalKey<ScaffoldState> globalKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(bottom: 10),
      height: 70,
      width: double.infinity,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                globalKey.currentState!.openDrawer();
              },
              icon: ImageIcon(AssetImage('assets/images/drawer_menu.png')),
              color: Colors.black,
            ),
            Text(
              "COVID-19 VIRUS TRACKER",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Icon(
              Icons.search,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
