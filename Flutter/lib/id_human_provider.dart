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

class HumanProvider {
  Map<int, Human> heroes = {};

  Future<Human> loadHeroByID(int heroId) async {
    if (heroes.containsKey(heroId)) {
      return heroes[heroId]!;
    }

    try {
      heroes[heroId] = await InfoHeroesApi().requestInfoHeroes(heroId);
    } catch (e) {
      print(e);
      throw ("Невозможно загрузить героя");
    }
    return heroes[heroId]!;
  }
}
