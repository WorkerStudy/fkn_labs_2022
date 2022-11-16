import 'package:flutter/material.dart';
import 'package:flutter_application_1/card_hero.dart';

import 'package:provider/provider.dart';

import 'id_human_provider.dart';

//Работа со списком героев (PageView)
class ListHeroes extends StatelessWidget {
  final PageController controller =
      PageController(initialPage: 0, viewportFraction: 0.80);

  @override
  Widget build(BuildContext context) {
    var listIdHeroes = Provider.of<IdHumanProvider>(context).idHeroes;

    return listIdHeroes == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : PageView.builder(
            controller: controller,
            itemCount: listIdHeroes.length,
            onPageChanged: (activCardNumber) {
              print("$activCardNumber");
            },
            itemBuilder: (context, index) {
              return CardHero(listIdHeroes[index]);
            },
          );
  }
}
