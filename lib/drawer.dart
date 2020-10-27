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
              Navigator.pushReplacementNamed(context, Routes.babyphotography)),
          _createDrawerItem(icon: Icons.note, text: 'Kids Photography',  onTap: () =>
              Navigator.pushReplacementNamed(context, Routes.kidsphotography)),
          _createDrawerItem(icon: Icons.note, text: 'Events Photography',  onTap: () =>
              Navigator.pushReplacementNamed(context, Routes.eventsphotography)),
          _createDrawerItem(icon: Icons.note, text: 'Wildlife',  onTap: () =>
              Navigator.pushReplacementNamed(context, Routes.wildlife)),
          _createDrawerItem(icon: Icons.note, text: 'Creative',  onTap: () =>
              Navigator.pushReplacementNamed(context, Routes.creative)),
          _createDrawerItem(icon: Icons.note, text: 'Photography in rain',  onTap: () =>
              Navigator.pushReplacementNamed(context, Routes.photographyinrain)),
          _createDrawerItem(icon: Icons.note, text: 'Macro',  onTap: () =>
              Navigator.pushReplacementNamed(context, Routes.macro)),
          _createDrawerItem(icon: Icons.note, text: 'Monochrome',  onTap: () =>
              Navigator.pushReplacementNamed(context, Routes.monochrome)),
          _createDrawerItem(icon: Icons.note, text: 'Birds',  onTap: () =>
              Navigator.pushReplacementNamed(context, Routes.birds)),
          _createDrawerItem(icon: Icons.note, text: 'Colour Pictorial',  onTap: () =>
              Navigator.pushReplacementNamed(context, Routes.colourpictorial)),
          _createDrawerItem(icon: Icons.note, text: 'Pictorial Sport',  onTap: () =>
              Navigator.pushReplacementNamed(context, Routes.pictorialsport)),
          _createDrawerItem(icon: Icons.note, text: 'I Am.....',  onTap: () =>
              Navigator.pushReplacementNamed(context, Routes.iam)),
          _createDrawerItem(icon: Icons.note, text: 'My TV Interviews',  onTap: () =>
              Navigator.pushReplacementNamed(context, Routes.interviews)),
          _createDrawerItem(icon: Icons.note, text: 'Contact Me',  onTap: () =>
              Navigator.pushReplacementNamed(context, Routes.contactme))
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