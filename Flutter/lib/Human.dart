import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class InfoHeroesApi {
  final _publicKey = "01675a2a6b75d5593a99cc25ee00306c";
  final _hash = "d359c2342dc4b50034e51a54e2379319";
  int ts = 0;
  Dio dio = new Dio();

  requestListHeroes(int count) async {
    List<int> idHeroes = [];
    String url = "https://gateway.marvel.com:443/v1/public/characters?";

    print(url);

    try {
      Response response = await dio.get(url, queryParameters: {
        "ts": ts,
        "apikey": _publicKey,
        "hash": _hash,
        "limit": count
      });

      for (var dataHero in response.data["data"]["results"]) {
        idHeroes.add(dataHero["id"]);
        print(dataHero["id"]);
      }

      return idHeroes;
    } catch (e) {
      print(e.toString());
      print("Не удалось получить доступ");
    }
  }

  requestInfoHeroes(int id) async {
    String url =
        "https://gateway.marvel.com:443/v1/public/characters/${id.toString()}?";

    try {
      Response response = await dio.get(url, queryParameters: {
        "ts": ts.toString(),
        "apikey": _publicKey,
        "hash": _hash
      });

      var json = response.data["data"]["results"][0];

      return Human.fromJson(json);
    } catch (e) {
      print(e.toString());
      print("Не удалось получить доступ");
      return Human.error(id: id, e: e);
    }
  }
}

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

//Стандартные стили текста
const TextStyle titleStyle = const TextStyle(
    color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold);

const TextStyle subTitleStyle = const TextStyle(
    color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700);

//Содержит в себе информацию о героях
class Human {
  int? id;
  String? name;
  Image? imageHero;
  String? info;
  Color? figColors;
  Object? e;

  Human(
      {required this.id,
      required this.name,
      required this.imageHero,
      required this.info,
      this.figColors = Colors.green});

  Human.fromJson(Map<String, dynamic> response) {
    id = response['id'];
    print(response['name']);
    name = response['name'];
    print(response['description']);
    info = response['description'];
    var pathimg = response['thumbnail']['path'] +
        "." +
        response['thumbnail']['extension'];

    imageHero = Image.network(pathimg, errorBuilder:
        (BuildContext context, Object exception, StackTrace? stackTrace) {
      return Image.asset("assets/img/img_not_found.jpg", fit: BoxFit.cover);
    }, fit: BoxFit.cover);

    figColors = Colors.white;
    e = null;
  }

  Human.error({required this.id, required this.e}) {
    imageHero = Image.asset("assets/img/img_not_found.jpg", fit: BoxFit.cover);
  }
}
