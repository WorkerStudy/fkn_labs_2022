import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'human.dart';

class PosterHero extends StatelessWidget {
  Human _hero;

  /// Создает виджет содержащий  задний фон Аватар и текст: Имя, Цитату героя
  PosterHero(this._hero);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
            child: Stack(children: [
          SizedBox.expand(child: _hero.imageHero),
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
              child: BackButton(
                color: Colors.white,
              )),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: Text(
                    "${_hero.name}",
                    style: titleStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
                Text(
                  "${_hero.info}",
                  style: subTitleStyle,
                  textAlign: TextAlign.left,
                )
              ],
            ),
          )
        ]))
      ],
    ));
  }
}
