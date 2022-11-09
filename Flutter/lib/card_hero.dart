import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/human.dart';
import 'package:flutter_application_1/poster_hero.dart';
import 'package:provider/provider.dart';

class CardHero extends StatelessWidget {
  //Human? _hero;
  int _idHero;
  CardHero(this._idHero);

  @override
  Widget build(BuildContext context) {
    var _heroes = Provider.of<HumanProvider>(context).heroes;
    var _hero;
    if (!_heroes.containsKey(_idHero)) {
      Provider.of<HumanProvider>(context, listen: false).loadHeroByID(_idHero);
      return Center(
          child: CircularProgressIndicator(
        color: Colors.orange,
      ));
    } else {
      _hero = _heroes[_idHero];
    }

    return _hero.e != null
        ? Center(
            child: ElevatedButton(
                onPressed: () => reloadCard(context), child: Text("Restart")))
        : GestureDetector(
            onTap: () => _pressedCard(context, _hero),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 65),
              child: Hero(
                  tag: "${_hero.name}",
                  child: Card(
                      elevation: 0.6,
                      clipBehavior: Clip.hardEdge,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Stack(
                        children: [
                          SizedBox.expand(child: _hero.imageHero),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(child: Container()),
                                Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 15),
                                    child: Text(
                                        style: titleStyle,
                                        textAlign: TextAlign.left,
                                        "${_hero.name}")),
                              ])
                        ],
                      ))),
            ),
          );
  }

  void reloadCard(context) {
    Provider.of<HumanProvider>(context, listen: false).loadHeroByID(_idHero);
  }

  void _pressedCard(BuildContext context, Human hero) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PosterHero(hero),
    ));
  }
}
