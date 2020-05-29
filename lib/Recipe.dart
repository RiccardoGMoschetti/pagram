import 'dart:math';
import 'package:random_words/random_words.dart';

class Recipe {
  String imageName;
  String name;
  String title;
  String blurb;
  String longDescription;
  int minutes;
  int difficulty;
  String id;

  List<String> steps;

  Recipe([String _imageName, String _title, String _blurb,
      String _longDescription, int _minutes, int _difficulty]) {

    imageName = _imageName;
    title = _title;
    blurb = _blurb;
    longDescription = _longDescription;
    minutes = _minutes;
    difficulty = _difficulty;
  }
}

List<Recipe> makeFakeRecipes(int no) {
  Random random = new Random();
  List<Recipe> fakeRecipes = List<Recipe>();
  List<WordNoun> randomWords = generateNoun().take(no).toList();

  for (int i = 0; i < no; i++) {
    Recipe recipe = Recipe(
      i % 2 == 0 ? "whitesauce.jpg" : "redsauce.jpeg",
      (i % 2 == 0 ? "Penne " : "Spaghetti ") + randomWords[i].word,
      "spaghetti buonissimi per te",
      "cuoci bene fino a 90 gradi",
      random.nextInt(120) + 1,
      random.nextInt(3) + 1,
    );


    fakeRecipes.add(recipe);
  }
  return fakeRecipes;
}
