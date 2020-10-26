import 'package:flutter/material.dart';
import 'data.dart';
import 'drawer.dart';

class Routes {
  static const String home = HomePage.routeName;
  static const String weddings = WeddingsPage.routeName;
  static const String prepostweddings = PrePostWeddingsPage.routeName;
  static const String engagementshots= EngagementShotsPage.routeName;
  static const String pregnancyclicks = PregnancyClicksPage.routeName;
  static const String babyphotography = BabyPhotographyPage.routeName;
}
class EngagementShotsPage extends StatelessWidget {
  static const String routeName = '/engagementshots';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title:Image.asset('assets/icon4.png'), backgroundColor:Colors.black,
        automaticallyImplyLeading: false,
      ),
      endDrawer: AppDrawer(),
      body:  Container (
          child: Text("Engagement Shots",style: TextStyle(color: Colors.white) )
      ),
    );
  }
}
class PregnancyClicksPage extends StatelessWidget {
  static const String routeName = '/pregnancyclicks';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title:Image.asset('assets/icon4.png'), backgroundColor:Colors.black,
        automaticallyImplyLeading: false,
      ),
      endDrawer: AppDrawer(),
      body:  Container (
          child: Text("Pregnancy Clicks",style: TextStyle(color: Colors.white) )
      ),
    );
  }
}
class BabyPhotographyPage extends StatelessWidget {
  static const String routeName = '/babyphotography';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title:Image.asset('assets/icon4.png'), backgroundColor:Colors.black,
        automaticallyImplyLeading: false,
      ),
      endDrawer: AppDrawer(),
      body:  Container (
          child: Text("Baby Photography",style: TextStyle(color: Colors.white) )
      ),
    );
  }
}
class HomePage extends StatelessWidget {
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
            title:Image.asset('assets/icon4.png'), backgroundColor:Colors.black,
          automaticallyImplyLeading: false,
        ),
        endDrawer: AppDrawer(),
        body:
            GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children:getbanner()
            ),

    );
  }
}
List<Widget> getbanner() {
  List<Widget> ll = new List<Widget>();
  for (int j = 0; j < banner.length; j++) {
    ll.add(
      Container(
          padding: const EdgeInsets.all(8),
          child: Image.network(banner[j].toString())
      ),
    );
  }
  return ll;
}
class WeddingsPage extends StatelessWidget {
  static const String routeName = '/weddings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
            title:Image.asset('assets/icon4.png'), backgroundColor:Colors.black,
          automaticallyImplyLeading: false,
        ),
        endDrawer: AppDrawer(),
        body:
            GridView.count(
                          crossAxisCount: 2,
                                children:getlistitems()

                        )
             );
  }
}

List<Widget> getlistitems()
{
  List<Widget> ll =new List<Widget>();
  for(int i=0;i<photos.length;i++) {

    ll.add(
        InkWell(
            child: Container(
                child: Stack(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 10.0),
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(

                                  image: DecorationImage(
                                    image: NetworkImage(
                                        photos[i]["photo"].toString()),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Column(mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(bottom: 10.0),
                                child: Text(
                                  photos[i]["captions"].toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Canterbury',
                                  ),
                                ),
                              )
                            ],
                          )
                        ],)
                    ]
                )
            )
        )

    );
  }
  return ll;
}
Widget _buildNormalContainer() {
  return Center(
    child: Container(
      height: 100.0,
      width: 100.0,
      color: Colors.red,
    ),
  );
}

Widget _buildWideContainers() {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          height: 100.0,
          width: 100.0,
          color: Colors.red,
        ),
        Container(
          height: 100.0,
          width: 100.0,
          color: Colors.yellow,
        ),
      ],
    ),
  );
}



class PrePostWeddingsPage extends StatelessWidget {

  static const String routeName = '/prepostweddings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title:Image.asset('assets/icon4.png'), backgroundColor:Colors.black,
          automaticallyImplyLeading: false,
        ),
        endDrawer: AppDrawer(),
        body: Container(
            child: Text("prepostweddings",style: TextStyle(color: Colors.white))
        )
    );
  }
}