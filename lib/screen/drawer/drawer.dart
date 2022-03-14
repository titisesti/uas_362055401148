import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      height: double.infinity,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.only(left: 20, bottom: 40),
          children: <Widget>[
            _createHeader(),
            _createDrawerItem(
              icon: Image.asset('assets/images/quarantine.png'),
              text: 'Quarantine centres',
            ),
            _createDrawerItem(
              icon: Image.asset('assets/images/medicine.png'),
              text: 'Events',
            ),
            _createDrawerItem(
              icon: Image.asset('assets/images/symptoms.png'),
              text: 'Notes',
            ),
            _createDrawerItem(
                icon: Image.asset('assets/images/volunteer.png'),
                text: 'Useful Links'),
            _createDrawerItem(
                icon: Image.asset('assets/images/live support.png'),
                text: 'Report an issue'),
            SizedBox(
              height: 300,
            ),
            bottom()
          ],
        ),
      ),
    );
  }

  bottom() {
    return Container(
      margin: EdgeInsets.only(right: 50),
      width: 70,
      // height: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.settings_outlined,
            color: Colors.black54,
          ),
          Text('Setting'),
          Container(
            height: 20,
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          ),
          Text("Log Out")
        ],
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        child: Center(
          child: Container(
              height: 60,
              child: Row(children: [
                CircleAvatar(
                  child: Image(
                    image: AssetImage('assets/images/profile.png'),
                  ),
                  radius: 30,
                ),
                SizedBox(width: 20),
                Container(
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Titis Esti Rahayu',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Text(
                        'Active Cases',
                        style: TextStyle(color: Colors.black54, fontSize: 14),
                      ),
                    ],
                  ),
                )
              ])),
        ));
  }

  Widget _createDrawerItem({required Widget icon, required String text}) {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 5),
      leading: icon,
      title: Text(text),
    );
  }
}
