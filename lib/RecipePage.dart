import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'Recipe.dart';
import 'Strings.dart';
import 'Configurations.dart';

List<Recipe> recipes = List<Recipe>();

class RecipePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    recipes = makeFakeRecipes(20);
    return Scaffold(
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
        body: BodyLayout());
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

Widget _myListView(BuildContext context) {
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (context, index) {
      return Card(
        color: Colors.yellow[70],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          height: 100.0,
          padding: const EdgeInsets.all(8.0),
          child: Row(children: <Widget>[
            Expanded(
                flex: 2,
                child: Image.asset("Image/" + (recipes[index].imageName))),
            Expanded(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  // align the text to the left instead of centered
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(recipes[index].title, style: tableTitleStyle),
                    Text(recipes[index].blurb, style: tableBasicStyle),
                    Text(
                        Translations.show("Time") +
                            ": " +
                            recipes[index].minutes.toString() +
                            " min.",
                        style: tableBasicStyle),
                  ],
                ),
              ),
            ),
          ]),
        ),
      );
    }, //itembuilder
  );
}
