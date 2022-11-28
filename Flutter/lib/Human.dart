import 'package:flutter/material.dart';

//Стандартные стили текста
const TextStyle titleStyle =
    TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold);

const TextStyle subTitleStyle =
    TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700);

//Содержит в себе информацию о героях
class Human {
  final String name;
  final String urlImg;
  final String info;
  final Color figColors;

  Human(
      {required this.name,
      required this.urlImg,
      required this.info,
      this.figColors = Colors.green});
}

final Image imghero = Image.asset("assets/img/ui.jpg");

List<Human> heroes = [
  Human(
      name: "Юи Хирасава",
      urlImg:
          "https://i.pinimg.com/736x/53/eb/23/53eb23e56606f4247c9e64730a5a9770.jpg",
      info: "Клубничка — это сердце тортика.",
      figColors: Colors.green),
  Human(
      name: "Цумуги Котобуки",
      urlImg:
          "https://mediaformasi.com/content/images/wordpress/2018/06/fb_img_1527315781425.jpg",
      info: "Not Info",
      figColors: Colors.blue),
  Human(
      name: "Мио Акияма",
      urlImg: "https://i.imgur.com/MnOqJFw.jpg",
      info: "Not Info",
      figColors: Colors.orange),
  Human(
      name: "Рицу Тайнака",
      urlImg:
          "https://animejoy.ru/uploads/posts/2018-01/1516637488_anime-keyon-2-sezon-k-on-smotret-onlayn-2.jpg",
      info:
          "Что вершит судьбу человечества в этом мире? Некое незримое существо или закон....",
      figColors: Colors.pink)
];
