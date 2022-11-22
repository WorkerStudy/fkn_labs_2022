import 'package:dio/dio.dart';

import 'human.dart';

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
      throw (e.toString());
    }
  }
}
