import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'Recipe.dart';
import 'Strings.dart';
import 'Configurations.dart';
import 'RecipeListPage.dart';
import 'package:flutter_beautiful_popup/main.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sqflite/sqflite.dart';

void main(rootBundle) {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: WelcomeScreen());
  }
}

List<Recipe> recipes = List<Recipe>();

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.yellowAccent[100],
      appBar: AppBar(
        title: Text('pastagram',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                fontFamily: 'NixieOne')),
        backgroundColor: Colors.deepOrange[500],
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black54,
          backgroundColor: Colors.yellowAccent[100],
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('Log In'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.change_history),
              title: Text('pasta of the day'),
            ),
          ]),
      body:
  Stack(
      children: [
        Stack(
          children:<Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Column(
                 crossAxisAlignment: CrossAxisAlignment.end,
                 children: <Widget>[
                 Text('Hot tip!', style: TextStyle(fontSize: 26,
                     fontFamily: 'AmaticSC',
                     color: Colors.redAccent,
                     fontWeight: FontWeight.bold),
                 ),
                 Ink(
                   decoration: const ShapeDecoration(
                     color: Colors.lightGreen,
                     shape: CircleBorder(),
                   ),
                   child: IconButton(
                     icon: Icon(Icons.local_florist),
                     color: Colors.white,
                     onPressed: () {},
                   ),
                 )
           ],),
              ),
            ),
        ],),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RecipeListPage()),
              ),
              child: Center(
                child: Image(
                  image: AssetImage('Image/appstore.png'),
                  width: 200,
                ),
              ),
            ),
            Container(
              color: Colors.white70,
              margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.search, color: Colors.black54, size: 20.0),
                  SizedBox(width: 10.0),
                  Text(
                    'Search your pasta by name',
                    style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'NixieOne',
                        color: Colors.black54),
                  ),
                ],
              ),
            )
          ],
        ),

    ]),
    ),);
  }
}

/*class ecoTemplate extends BeautifulPopupTemplate {
  final BeautifulPopup options;
  ecoTemplate(this.options) : super(options);

  @override
  final illustrationKey = 'Image/boiling-pot.jpeg';
  @override
  Color get primaryColor =>
      options.primaryColor
      Color(
          0xff000000); // The default primary color of the template is Colors.black.
  @override
  final maxWidth =
      400; // In most situations, the value is the illustration size.
  @override
  final maxHeight = 600;
  @override
  final bodyMargin = 10;

  // You need to adjust the layout to fit into your illustration.
  @override
  get layout {
    return [
      Positioned(
        child: background,
      ),
      Positioned(
        top: percentH(10),
        child: title,
      ),
      Positioned(
        top: percentH(40),
        height: percentH(actions == null ? 32 : 42),
        left: percentW(10),
        right: percentW(10),
        child: content,
      ),
      Positioned(
        bottom: percentW(10),
        left: percentW(10),
        right: percentW(10),
        child: actions ?? Container(),
      ),
    ];
  }
}*/

// RECIPE Page

