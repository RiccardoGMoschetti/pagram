import 'package:csv/csv_settings_autodetection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:pastagram/RecipeRepository.dart';
import 'package:pastagram/Recipe.dart';
import 'package:pastagram/Strings.dart';
import 'package:pastagram/Configurations.dart';
import 'package:csv/csv.dart';

List<Recipe> recipes = List<Recipe>();
String RecipeInstructions = """Ingredients (party of 4):

320g spaghetti
200g pecorino cheese (grated)
Black pepper (as much as your heart can take it)
Salt""";
Future<String> loadAsset(String path) async {
  return await rootBundle.loadString(path);
}

void loadCSV() {
  loadAsset('assets/db/Recipes.csv').then((dynamic output) {
    var csvRaw = output;
    var d = new FirstOccurrenceSettingsDetector(
        eols: ['\r\n'], textDelimiters: ['"', "'"], fieldDelimiters: [";"]);

    new CsvToListConverter(csvSettingsDetector: d);
    //  print ("csv raw: $csvRaw");
    List<List<dynamic>> rowsAsListOfValues =
        CsvToListConverter(csvSettingsDetector: d).convert(csvRaw);
    for (final row in rowsAsListOfValues) {
      Recipe thisRecipe = new Recipe();
      thisRecipe.name = row[1];
     // thisRecipe.difficulty
      print (row[1]);
    };
  });
}

class RecipeDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    loadCSV();
    return Scaffold(
        backgroundColor: Colors.yellowAccent[100],
        appBar: AppBar(
          title: Text('Cacio e Pepe',
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
    return SingleChildScrollView(
      child: SizedBox(
        height: 3000,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //  padding: const EdgeInsets.all(8),
          children: <Widget>[
            Image(
              image: AssetImage('Image/caciopeppe.jpg'),
            ),
            Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ' This roman recipe is one of the most loved in all of Italy. It takes only three ingredients but you still need a good roman friend to share the secret of that creamy pecorino sauce. ',
                      style: tableBasicStyle,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 200,
              child: Image(
                image: AssetImage('Image/cookingpot.png'),
              ),
            ),
            Container(
              height: 70,
              child: Container(
                child: Text(
                  'LET\'S GET DIRTY',
                  style: TextStyle(
                      fontFamily: 'AmaticSC',
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.bottomLeft,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(RecipeInstructions, maxLines: 100),
                      SizedBox(width: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Step #1', style: stepsBasicStyle),
                      ),
                      Text(
                          ' Put a pot of water to boil and salt it. In the meanwhile smash some black pepper seeds and throw them in a pan. Keep some aside for serving.',
                          style: tableBasicStyle),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Step #2', style: stepsBasicStyle),
                      ),
                      Text(
                          'When the water starts boiling, throw in the pasta and drown it in the water with a pair of tongs. Listen carefully now because this step is extremely important. Check out the package and observe how many minutes the pasta needs boiling. Spaghetti usually needs 9 minutes to be done properly so call out Siri or Alexa and make sure you set the timer for the right amount of time. Legend has it that for every over-cooked pasta, an Italian feels sad out of nowhere. ',
                          style: tableBasicStyle),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Step #3', style: stepsBasicStyle),
                      ),
                      Text(
                          'Now that your pasta is boiling, you can start toasting the smashed pepper in a skillet. In a minute or two you can add some pasta water in the mix. If you see white foam, you are doing it right (it’s the starch that does some magic).',
                          style: tableBasicStyle),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Step #4', style: stepsBasicStyle),
                      ),
                      Text(
                          'When the pasta is done, gently put it in the skillet with the toasted pepper and let it breath at medium fire for a couple of minutes. Add some pasta water to the mix. ',
                          style: tableBasicStyle),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Step #5', style: stepsBasicStyle),
                      ),
                      Text(
                          'We can handle the creamy pecorino sauce now. Pay attention. We put in a bowl half of the reserved cheese. Add pasta water over the cheese and start mixing it with whip. It should get creamy while you mix it, adjust with pasta water.  Add some more pecorino and some more pasta water until you reach the desired creaminess, just save some for later use.',
                          style: tableBasicStyle),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Hot Tip!',
                                style: TextStyle(
                                    fontFamily: 'AmaticSC',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                          'If you manage to somehow mix the pecorino and the pasta water above the pot of water where the pasta cooked, awesome! Do it! The cheese will slowly melt. ',
                          style: tableBasicStyle),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Step #6', style: stepsBasicStyle),
                      ),
                      Text(
                          'You can take the pasta from the stove and gently add the creamy pecorino sauce with one hand and with the other mix it with the pasta.If it looks too watery, no worries, it’s gonna get better once you add some of the pecorino reserved. When mixing the pasta, your goal is to spread the sauce to every inch there Is, so get wild, ask for permission and make the pasta dance, crawl, jump etc. ',
                          style: tableBasicStyle),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Step #7',
                          style: stepsBasicStyle,
                        ),
                      ),
                      Text(
                          'Add the rest of the pepper evenly in all four plates',
                          style: tableBasicStyle),
                    ]),
              ),
            )),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image(
                image: AssetImage('Image/wine.png'),
                height: 100,
                width: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  '  If you have an Italian friend for dinner and his face starts getting red in protest for the pasta not being done well enough, throw some red wine at them. The perfect one for Cacio e Pepe is Rosso di Montalcino, but any light red wine will do just as well. ',
                  style: tableBasicStyle),
            ),
          ],
        ),
      ),
    );
  }
}
