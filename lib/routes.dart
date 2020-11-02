import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'drawer.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:async' show Future;
import 'package:http/http.dart';

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
  static const String photodetails = PhotoDetailsPage.routeName;
}
void setErrorBuilder() {
  ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
    return Scaffold(
        body: Center(
            child: Text("Unexpected error. See console for details.")));
  };
}

/* Home page */
class Banner {
  String photo;

  Banner({this.photo});

  factory Banner.fromJson(Map<String, dynamic> parsedJson) {
    return Banner(
        photo: parsedJson["photo"] as String,
       );
  }
  Map<String, dynamic> toJson() => { "photo": photo,};
}

class Category
{
  String albumCategory;
  String photo;
  String captions;

  Category({this.albumCategory,this.photo,this.captions});

  factory Category.fromJson(Map<String, dynamic> parsedJson){
    return Category(
      albumCategory:parsedJson["albumcategory"] as String,
      photo:parsedJson["photo"] as String,
      captions:parsedJson["captions"] as String,
    );
  }
  Map<String, dynamic> toJson()=>{"albumcategory":albumCategory, "photo":photo,"captions":captions,};
}
List<Banner> parsePhotos(String responsebody)
{
  final parsed = jsonDecode(responsebody).cast<Map<String,dynamic>>();
  return parsed.map<Banner>((json)=>Banner.fromJson(json)).toList();
}
Future<List<Banner>> fetchPhotos() async{
  final response = await rootBundle.loadString('assets/banner.json');
  return compute(parsePhotos,response);
}
//category
List<Category> parseCategory(String responsebody)
{
  final parsed = jsonDecode(responsebody).cast<Map<String,dynamic>>();

  return parsed.map<Category>((json)=>Category.fromJson(json)).toList();
}
Future<List<Category>> fetchCategory() async{
  final response = await rootBundle.loadString('assets/web.json');
  return compute(parseCategory,response);
}
class HomePage extends StatelessWidget {

  static const String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    setErrorBuilder();
    return new Scaffold(
        appBar: AppBar(
            title:Image.asset('assets/icon4.png'), backgroundColor:Colors.black,
          automaticallyImplyLeading: false,
        ),
        endDrawer: AppDrawer(),
        body:FutureBuilder<List<Banner>>(
          future:fetchPhotos(),
          builder:(context,snapshot)
            {
              if(snapshot.hasError)print(snapshot.error);
              return snapshot.hasData?PhotosList(photos:snapshot.data):Center(child:CircularProgressIndicator());

            },
        ),

    );
  }
}

class PhotosList extends StatelessWidget
{
  final List<Banner> photos;
  PhotosList({Key key, this.photos}):super(key:key);
  @override
  Widget build(BuildContext context)
  {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: photos.length,

        itemBuilder: (context, index)
          {
            return Image.network(photos[index].photo);
          },
    );
  }
}
/* Home page ends here */
List<Widget> getlistitems(String category,BuildContext context, var mydata)
{
  List<Widget> ll =new List<Widget>();
  List<Category> categories = mydata;
 // var kn = category.((u)=>u["albumcategory"]=="wedding");
  for(int i=0;i<categories.length;i++) {

    ll.add(
        InkWell(
          onTap:(){
            return Navigator.pushReplacementNamed(context , Routes.photodetails);
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
                                    image: NetworkImage(categories[i].photo),
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
                                  categories[i].captions,
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
List<Widget> getphotodetails(String category,BuildContext context, var mydata)
{
  List<Widget> ll =new List<Widget>();
  for(int i=0;i<mydata.length;i++) {

    ll.add(
        InkWell(
            onTap:(){
              return Navigator.pushReplacementNamed(context , Routes.photodetails);
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
                                    image: NetworkImage(mydata.photos[i]["couples"].toString()),
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
        body: new FutureBuilder(builder: (context,snapshot){
          var myData = json.decode(snapshot.data.toString());
          return  GridView.count(
              crossAxisCount: 2,
              children:getlistitems("wedding", context,myData)

          );

        },future: DefaultAssetBundle.of(context).loadString("assets/web.json"),));
  }
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
class PhotoDetailsPage extends StatelessWidget {
  static const String routeName = '/photodetails';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Image.asset('assets/icon4.png'), backgroundColor:Colors.black,
          automaticallyImplyLeading: false,
        ),
        endDrawer: AppDrawer(),
        body:new FutureBuilder(builder: (context,snapshot){
      var myData = json.decode(snapshot.data.toString());
       return  GridView.count(
            crossAxisCount: 2,
            children:getphotodetails("photos", context, myData)
        );
        },future: DefaultAssetBundle.of(context).loadString("assets/photodetails.json"),));
  }
}
class EngagementShotsPage extends StatelessWidget {
  static const String routeName = '/engagementshots';

  final List<Category> categories;
  EngagementShotsPage({Key key, this.categories}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title:Image.asset('assets/icon4.png'), backgroundColor:Colors.black,
        automaticallyImplyLeading: false,
      ),
      endDrawer: AppDrawer(),
      body:FutureBuilder<List<Category>>(
        future:fetchCategory(),
        builder:(context,snapshot)
        {
          if(snapshot.hasError)print(snapshot.error);

          if(snapshot.hasData)
            {

              // List<Category> a = snapshot.data.where((element) => false)
               List<Category> b = snapshot.data.where((s)=>s.albumCategory.contains('engagementshots')).toList();

               return GridView.builder(

                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                 itemCount: b.length,

                 itemBuilder: (context, index)
                 {

                   return  InkWell(
                     onTap:(){
                       return Navigator.pushReplacementNamed(context , Routes.photodetails);
                     }
                     ,

                     child: Padding(
                       padding:
                       EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0, top: 10.0),
                       child: Container(
                         alignment: Alignment.center,
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[
                             Flexible(
                               child: Image.network(
                                 b[index].photo,
                                 width: 150,

                               ),
                             ),
                             Padding(
                               padding: EdgeInsets.all(10.0),
                               child: Text(
                                 b[index].captions,
                                 maxLines: 1,
                                 softWrap: true,
                                 textAlign: TextAlign.center,
                                 style: TextStyle(
                                     color: Colors.white),

                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                   );

                 },
               );

            }
          return CircularProgressIndicator();
        /* return snapshot.hasData?PhotosList(photos:snapshot.data):Center(child:CircularProgressIndicator());*/
        },
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
