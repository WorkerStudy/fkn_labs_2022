import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/card_hero.dart';
import 'package:flutter_application_1/poster_hero.dart';
import 'human.dart';

//Работа со списком героев (PageView)
class ListHeroes extends StatelessWidget {
  final PageController controller =
      PageController(initialPage: 0, viewportFraction: 0.80);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemCount: heroes.length,
      onPageChanged: (activ_card_number) {
        print("$activ_card_number");
      },
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () => _pressedCard(context, heroes[index]),
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 65),
                child: CardHero(heroes[index])));
      },
    );
  }

  void _pressedCard(BuildContext context, Human hero) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PosterHero(hero),
    ));
  }
}
