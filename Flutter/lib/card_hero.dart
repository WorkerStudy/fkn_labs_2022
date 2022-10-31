import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/human.dart';

class CardHero extends StatelessWidget {
  Human _hero;

  CardHero(this._hero);

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: _hero.name,
        child: Card(
            elevation: 0.6,
            clipBehavior: Clip.hardEdge,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Stack(
              children: [
                SizedBox.expand(child: _hero.imageHero),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(child: Container()),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child: Text(
                          style: titleStyle,
                          textAlign: TextAlign.left,
                          _hero.name)),
                ])
              ],
            )));
  }
}
