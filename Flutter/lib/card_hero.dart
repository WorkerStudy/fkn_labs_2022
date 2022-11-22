import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'human.dart';
import 'id_human_provider.dart';
import 'poster_hero.dart';

class CardHero extends StatelessWidget {
  int _idHero;
  CardHero(this._idHero, {super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Human>(
        future: Provider.of<HumanProvider>(context).loadHeroByID(_idHero),
        builder: ((context, hero) {
          if (hero.hasData) {
            return GestureDetector(
              onTap: () => _pressedCard(context, hero.data!),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 65),
                child: Hero(
                    tag: {hero.data!.name},
                    child: Card(
                        elevation: 0.6,
                        clipBehavior: Clip.hardEdge,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            CachedNetworkImage(
                              imageUrl: hero.data!.urlImg,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.orange,
                                ),
                              ),
                              errorWidget: (context, url, error) => Image.asset(
                                "assets/img/img_not_found.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                                bottom: 10,
                                left: 10,
                                right: 0,
                                child: Text(
                                    style: titleStyle,
                                    textAlign: TextAlign.left,
                                    hero.data!.name)),
                          ],
                        ))),
              ),
            );
          } else if (hero.hasError) {
            return Center(
              child: Text(hero.error.toString(), style: subTitleStyle),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        }));
  }

  void _pressedCard(BuildContext context, Human hero) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PosterHero(hero),
    ));
  }
}
