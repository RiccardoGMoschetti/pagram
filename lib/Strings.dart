class Translations {
  static Map<String, Map<String, String>> words = {
    "en_US": {
      "Difficulty": "Difficulty",
      "Time": "Time",
    },
    "it_IT": {"Time": "Tempo", "Difficulty": "Difficoltà"},
  };
  static show(String word) {
    String locale = "en_US"; //TODO: make dynamic based on phone locale
    return words[locale][word];
  }
}
