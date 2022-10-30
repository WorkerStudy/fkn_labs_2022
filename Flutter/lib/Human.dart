import 'package:flutter/material.dart';

//Содержит в себе информацию о героях
class Human {
  final String name;
  final String pathAvatar;
  final String info;
  final Color figColors;

  const Human(
      {required this.name,
      required this.pathAvatar,
      required this.info,
      this.figColors = Colors.green});
}

List<Human> heroes = [
  const Human(
      name: "Юи Хирасава",
      pathAvatar: "assets/img/ui.jpg",
      info: "Not Info",
      figColors: Colors.green),
  const Human(
      name: "Цумуги Котобуки",
      pathAvatar: "assets/img/mugi.jpg",
      info: "Not Info",
      figColors: Colors.blue),
  const Human(
      name: "Мио Акияма",
      pathAvatar: "assets/img/mio.jpg",
      info: "Not Info",
      figColors: Colors.orange),
  const Human(
      name: "Рицу Тайнака",
      pathAvatar: "assets/img/ritsu.jpg",
      info: "Not Info",
      figColors: Colors.pink)
];
