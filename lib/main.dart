import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'Recipe.dart';
import 'Strings.dart';
import 'Configurations.dart';
import 'RecipePage.dart';

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
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              FlatButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RecipePage()),
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
                  margin:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
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
                  ))
            ])));
  }
}
