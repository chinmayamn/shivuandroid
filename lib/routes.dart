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
  static const String kidsphotography = KidsPhotographyPage.routeName;
  static const String eventsphotography = EventsPhotographyPage.routeName;
  static const String wildlife = WildlifePage.routeName;
  static const String creative = CreativePage.routeName;
  static const String photographyinrain = PhotographyInRainPage.routeName;
  static const String macro = MacroPage.routeName;
  static const String monochrome = MonochromePage.routeName;
  static const String birds = BirdsPage.routeName;
  static const String colourpictorial = ColourPictorialPage.routeName;
  static const String pictorialsport = PictorialSportPage.routeName;
  static const String iam = IamPage.routeName;
  static const String interviews = InterviewsPage.routeName;
  static const String contactme = ContactMePage.routeName;


  static const String weddingdetails = WeddingDetailsPage.routeName;
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
                                children:getlistitems("wedding", context)

                        )
             );
  }
}
List<Widget> getlistitems(String category,BuildContext context)
{
  List<Widget> ll =new List<Widget>();
  for(int i=0;i<wedding.length;i++) {

    ll.add(
        InkWell(
          onTap:(){
            return Navigator.pushReplacementNamed(context , Routes.weddingdetails);
          }
          ,
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
                                        wedding[i]["photo"].toString()),
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
                                  wedding[i]["captions"].toString(),
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
List<Widget> getphotodetails(String category,BuildContext context)
{
  List<Widget> ll =new List<Widget>();
  for(int i=0;i<photodetails.length;i++) {

    ll.add(
        InkWell(
            onTap:(){
              return Navigator.pushReplacementNamed(context , Routes.weddingdetails);
            }
            ,
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
                                        photodetails[i][category].toString()),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
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
class WeddingDetailsPage extends StatelessWidget {

  static const String routeName = '/weddingdetails';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Image.asset('assets/icon4.png'), backgroundColor:Colors.black,
          automaticallyImplyLeading: false,
        ),
        endDrawer: AppDrawer(),
        body: GridView.count(
            crossAxisCount: 2,
            children:getphotodetails("couples", context)

        )

    );
  }
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
class KidsPhotographyPage extends StatelessWidget {
  static const String routeName = '/kidsphotography';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title:Image.asset('assets/icon4.png'), backgroundColor:Colors.black,
        automaticallyImplyLeading: false,
      ),
      endDrawer: AppDrawer(),
      body:  Container (
          child: Text("Kids Photography",style: TextStyle(color: Colors.white) )
      ),
    );
  }
}
class EventsPhotographyPage extends StatelessWidget {
  static const String routeName = '/eventsphotography';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title:Image.asset('assets/icon4.png'), backgroundColor:Colors.black,
        automaticallyImplyLeading: false,
      ),
      endDrawer: AppDrawer(),
      body:  Container (
          child: Text("Events Photography",style: TextStyle(color: Colors.white) )
      ),
    );
  }
}
class WildlifePage extends StatelessWidget {
  static const String routeName = '/wildlife';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title:Image.asset('assets/icon4.png'), backgroundColor:Colors.black,
        automaticallyImplyLeading: false,
      ),
      endDrawer: AppDrawer(),
      body:  Container (
          child: Text("Wildlife",style: TextStyle(color: Colors.white) )
      ),
    );
  }
}
class CreativePage extends StatelessWidget {
  static const String routeName = '/creative';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title:Image.asset('assets/icon4.png'), backgroundColor:Colors.black,
        automaticallyImplyLeading: false,
      ),
      endDrawer: AppDrawer(),
      body:  Container (
          child: Text("Creative",style: TextStyle(color: Colors.white) )
      ),
    );
  }
}
class PhotographyInRainPage extends StatelessWidget {
  static const String routeName = '/photographyinrain';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title:Image.asset('assets/icon4.png'), backgroundColor:Colors.black,
        automaticallyImplyLeading: false,
      ),
      endDrawer: AppDrawer(),
      body:  Container (
          child: Text("Photography in rain",style: TextStyle(color: Colors.white) )
      ),
    );
  }
}
class MacroPage extends StatelessWidget {
  static const String routeName = '/macro';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title:Image.asset('assets/icon4.png'), backgroundColor:Colors.black,
        automaticallyImplyLeading: false,
      ),
      endDrawer: AppDrawer(),
      body:  Container (
          child: Text("Macro",style: TextStyle(color: Colors.white) )
      ),
    );
  }
}
class MonochromePage extends StatelessWidget {
  static const String routeName = '/monochrome';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title:Image.asset('assets/icon4.png'), backgroundColor:Colors.black,
        automaticallyImplyLeading: false,
      ),
      endDrawer: AppDrawer(),
      body:  Container (
          child: Text("Monochrome",style: TextStyle(color: Colors.white) )
      ),
    );
  }
}
class BirdsPage extends StatelessWidget {
  static const String routeName = '/birds';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title:Image.asset('assets/icon4.png'), backgroundColor:Colors.black,
        automaticallyImplyLeading: false,
      ),
      endDrawer: AppDrawer(),
      body:  Container (
          child: Text("Birds",style: TextStyle(color: Colors.white) )
      ),
    );
  }
}
class ColourPictorialPage extends StatelessWidget {
  static const String routeName = '/colourpictorial';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title:Image.asset('assets/icon4.png'), backgroundColor:Colors.black,
        automaticallyImplyLeading: false,
      ),
      endDrawer: AppDrawer(),
      body:  Container (
          child: Text("Colour Pictorial",style: TextStyle(color: Colors.white) )
      ),
    );
  }
}
class PictorialSportPage extends StatelessWidget {
  static const String routeName = '/pictorialsport';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title:Image.asset('assets/icon4.png'), backgroundColor:Colors.black,
        automaticallyImplyLeading: false,
      ),
      endDrawer: AppDrawer(),
      body:  Container (
          child: Text("Pictorial Sport",style: TextStyle(color: Colors.white) )
      ),
    );
  }
}
class IamPage extends StatelessWidget {
  static const String routeName = '/iam';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title:Image.asset('assets/icon4.png'), backgroundColor:Colors.black,
        automaticallyImplyLeading: false,
      ),
      endDrawer: AppDrawer(),
      body:  Container (
          child: Text("I AM....",style: TextStyle(color: Colors.white) )
      ),
    );
  }
}
class InterviewsPage extends StatelessWidget {
  static const String routeName = '/interviews';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title:Image.asset('assets/icon4.png'), backgroundColor:Colors.black,
        automaticallyImplyLeading: false,
      ),
      endDrawer: AppDrawer(),
      body:  Container (
          child: Text("My TV Interviews",style: TextStyle(color: Colors.white) )
      ),
    );
  }
}
class ContactMePage extends StatelessWidget {
  static const String routeName = '/contactme';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title:Image.asset('assets/icon4.png'), backgroundColor:Colors.black,
        automaticallyImplyLeading: false,
      ),
      endDrawer: AppDrawer(),
      body:  Container (
          child: Text("Contact me",style: TextStyle(color: Colors.white) )
      ),
    );
  }
}
