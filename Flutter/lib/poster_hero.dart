import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'human.dart';

class PosterHero extends StatelessWidget {
  Human _hero;

  /// Создает виджет содержащий  задний фон Аватар и текст: Имя, Цитату героя
  PosterHero(this._hero);

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: {_hero.name},
        child: Scaffold(
          body: Stack(fit: StackFit.expand, children: [
            CachedNetworkImage(
                imageUrl: _hero.urlImg,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Image.asset(
                      "assets/img/img_not_found.jpg",
                      fit: BoxFit.cover,
                    )),
            const Positioned(
              top: 25,
              left: 10,
              child: BackButton(
                color: Colors.white,
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    child: Text(
                      _hero.name,
                      style: titleStyle,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Text(
                    _hero.info,
                    style: subTitleStyle,
                    textAlign: TextAlign.left,
                  )
                ],
              ),
            )
          ]),
        ));
  }
}
