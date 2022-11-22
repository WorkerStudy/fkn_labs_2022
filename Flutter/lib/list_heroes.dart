import 'package:flutter/material.dart';
import 'package:flutter_application_1/card_hero.dart';
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
        //context.
      },
      itemBuilder: (context, index) {
        return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 65),
            child: CardHero(heroes[index]));
      },
    );
  }
}
