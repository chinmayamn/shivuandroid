import 'package:flutter/material.dart';
import 'routes.dart';
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:Container(color:Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(icon:(Icons.contacts), text: 'Home',  onTap: () =>
              Navigator.pushReplacementNamed(context, Routes.home)),
          _createDrawerItem(icon: Icons.event, text: 'Weddings',  onTap: () =>
              Navigator.pushReplacementNamed(context, Routes.weddings)),
          _createDrawerItem(icon: Icons.note, text: 'Pre Post Weddings',  onTap: () =>
              Navigator.pushReplacementNamed(context, Routes.prepostweddings)),
          _createDrawerItem(icon: Icons.note, text: 'Engagement Shots',  onTap: () =>
              Navigator.pushReplacementNamed(context, Routes.engagementshots)),
          _createDrawerItem(icon: Icons.note, text: 'Pregnancy Clicks',  onTap: () =>
              Navigator.pushReplacementNamed(context, Routes.pregnancyclicks)),
          _createDrawerItem(icon: Icons.note, text: 'Baby Photography',  onTap: () =>
              Navigator.pushReplacementNamed(context, Routes.babyphotography))


        ],
      ),
    )
    );
  }

}

Widget _createHeader() {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
    /*  child: Stack(children: <Widget>[
        Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text("Flutter Step-by-Step",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500))),
      ])*/
  );
}

Widget _createDrawerItem(
    {IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
      //  Icon(icon,color:Colors.white),
        Padding(
          padding: EdgeInsets.only(left: 2.0),
          child: Text(text, style: TextStyle(color: Colors.white)),
        )
      ],
    ),
    onTap: onTap,
  );
}