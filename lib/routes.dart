import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'drawer.dart';
import 'dart:convert';
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
  String album;

  Category({this.albumCategory,this.photo,this.captions,this.album});

  factory Category.fromJson(Map<String, dynamic> parsedJson){
    return Category(
      albumCategory:parsedJson["albumcategory"] as String,
      photo:parsedJson["photo"] as String,
      captions:parsedJson["captions"] as String,
      album:parsedJson["album"] as String,
    );
  }
  Map<String, dynamic> toJson()=>{"albumcategory":albumCategory, "photo":photo,"captions":captions,"album":album};
}
class Albums
{
  String album;
  String photo;
  Albums({this.album,this.photo});

  factory Albums.fromJson(Map<String,dynamic> parsedJson){
    return Albums(
      album:parsedJson["album"] as String,
      photo:parsedJson["photo"] as String,
    );
  }
  Map<String, dynamic> toJson()=>{"album":album, "photo":photo};
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
//album
List<Albums> parseAlbums(String responsebody)
{
  final parsed = jsonDecode(responsebody).cast<Map<String,dynamic>>();

  return parsed.map<Albums>((json)=>Albums.fromJson(json)).toList();
}
Future<List<Albums>> fetchAlbums() async{
  final response = await rootBundle.loadString('assets/photodetails.json');
  return compute(parseAlbums,response);
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
        body:Grid(context,"wedding")
    );
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
        body: Grid(context,"prepostwedding"),
    );
  }
}
class PhotoDetailsPage extends StatelessWidget {
  static const String routeName = '/photodetails';
  final String album;
  PhotoDetailsPage([this.album]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Image.asset('assets/icon4.png'), backgroundColor:Colors.black,
          automaticallyImplyLeading: false,
        ),
        endDrawer: AppDrawer(),
        body:FutureBuilder<List<Albums>>(
            future:fetchAlbums(),
            builder:(context,snapshot)
            {
            if(snapshot.hasError)print(snapshot.error);
            if(snapshot.hasData)
            {
            List<Albums> b = snapshot.data.where((s)=>s.album.contains(album)).toList();
            return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: b.length,
            itemBuilder: (context, index)
            {
            return  InkWell(
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

                    ],
                  ),
                ),
              ),
            );

            },
            );

            }
            return CircularProgressIndicator();

            },
            )
    );
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
      body:Grid(context,"engagementshots"),
    );
  }
}

FutureBuilder<List<Category>> Grid(context,categ)
{
 return FutureBuilder<List<Category>>(
    future:fetchCategory(),
    builder:(context,snapshot)
    {
      if(snapshot.hasError)print(snapshot.error);
      if(snapshot.hasData)
      {

        List<Category> b = snapshot.data.where((s)=>s.albumCategory.contains(categ)).toList();
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: b.length,
          itemBuilder: (context, index)
          {
            return  InkWell(
              onTap:(){
                return Navigator.push(context ,new MaterialPageRoute(
                    builder: (BuildContext context) =>
                    new PhotoDetailsPage(b[index].album)));
              },
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
  );
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
      body: Grid(context,"pregnancy"),
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
      body: Grid(context,"baby"),
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
      body: Grid(context,"kids"),
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
      body: Grid(context,"events"),
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
