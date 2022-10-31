import 'package:flutter/material.dart';

//Стандартные стили текста
const TextStyle titleStyle = const TextStyle(
    color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold);

const TextStyle subTitleStyle = const TextStyle(
    color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700);

//Содержит в себе информацию о героях
class Human {
  final String name;
  final Image imageHero;
  final String info;
  final Color figColors;

  Human(
      {required this.name,
      required this.imageHero,
      required this.info,
      this.figColors = Colors.green});
}

final Image imghero = Image.asset("assets/img/ui.jpg");

List<Human> heroes = [
  Human(
      name: "Юи Хирасава",
      imageHero: Image.network(
          "https://i.pinimg.com/736x/53/eb/23/53eb23e56606f4247c9e64730a5a9770.jpg",
          errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
        return Image.asset("assets/img/ui.jpg", fit: BoxFit.cover);
      }, fit: BoxFit.cover),
      info: "Клубничка — это сердце тортика.",
      figColors: Colors.green),
  Human(
      name: "Цумуги Котобуки",
      imageHero: Image.network(
          "https://mediaformasi.com/content/images/wordpress/2018/06/fb_img_1527315781425.jpg",
          errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
        return Image.asset("assets/img/mugi.jpg", fit: BoxFit.cover);
      }, fit: BoxFit.cover),
      info: "Not Info",
      figColors: Colors.blue),
  Human(
      name: "Мио Акияма",
      imageHero: Image.network("https://i.imgur.com/MnOqJFw.jpg", errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return Image.asset("assets/img/mio.jpg", fit: BoxFit.cover);
      }, fit: BoxFit.cover),
      info: "Not Info",
      figColors: Colors.orange),
  Human(
      name: "Рицу Тайнака",
      imageHero: Image.network(
          "https://animejoy.ru/uploads/posts/2018-01/1516637488_anime-keyon-2-sezon-k-on-smotret-onlayn-2.jpg",
          errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
        return Image.asset("assets/img/ritsu.jpg", fit: BoxFit.cover);
      }, fit: BoxFit.cover),
      info:
          "Что вершит судьбу человечества в этом мире? Некое незримое существо или закон....",
      figColors: Colors.pink)
];
