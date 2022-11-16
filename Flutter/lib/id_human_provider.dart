import 'package:flutter/material.dart';

import 'human.dart';
import 'info_heroes_api.dart';

class IdHumanProvider extends ChangeNotifier {
  List<int>? idHeroes = null;
  Object? error;
  IdHumanProvider(int count) {
    loadIdHeroes(count);
  }

  loadIdHeroes(int count) async {
    List<int>? newHeroesId = await InfoHeroesApi().requestListHeroes(count);

    print(newHeroesId);
    idHeroes = newHeroesId;
    notifyListeners();
  }
}

class HumanProvider extends ChangeNotifier {
  Map<int, Human> heroes = {};

  loadHeroByID(int heroId) async {
    try {
      heroes[heroId] = await InfoHeroesApi().requestInfoHeroes(heroId);
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  loadListHeroesByID(List<int> listId) async {
    heroes = {};
    for (var id in listId) {
      heroes[id] = await InfoHeroesApi().requestInfoHeroes(id);
      notifyListeners();
    }
  }
}
