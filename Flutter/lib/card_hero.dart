import 'package:flutter/material.dart';
import 'human.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
              fit: StackFit.expand,
              children: [
                CachedNetworkImage(
                  imageUrl: _hero.urlImg,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: Colors.orange,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.warning,
                    color: Colors.red,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: Text(
                      style: titleStyle, textAlign: TextAlign.left, _hero.name),
                )
              ],
            )));
  }
}
