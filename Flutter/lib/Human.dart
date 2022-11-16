import 'package:flutter/material.dart';

//Содержит в себе информацию о героях
class Human {
  int? id;
  String? name;
  Image? imageHero;
  String? info;
  Color? figColors;
  Object? e;

  Human(
      {required this.id,
      required this.name,
      required this.imageHero,
      required this.info,
      this.figColors = Colors.green});

  Human.fromJson(Map<String, dynamic> response) {
    id = response['id'];
    print(response['name']);
    name = response['name'];
    print(response['description']);
    info = response['description'];
    var pathimg = response['thumbnail']['path'] +
        "." +
        response['thumbnail']['extension'];

    imageHero = Image.network(pathimg, errorBuilder:
        (BuildContext context, Object exception, StackTrace? stackTrace) {
      return Image.asset("assets/img/img_not_found.jpg", fit: BoxFit.cover);
    }, fit: BoxFit.cover);

    figColors = Colors.white;
    e = null;
  }

  Human.error({required this.id, required this.e}) {
    imageHero = Image.asset("assets/img/img_not_found.jpg", fit: BoxFit.cover);
  }
}
