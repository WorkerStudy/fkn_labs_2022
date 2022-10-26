import 'package:flutter/material.dart';
import 'Human.dart';
//Работа со списком героев

class ListHeroes extends StatelessWidget {
  List<Human> Heroes = [];
  ListHeroes() {
    Heroes.add(
        Human("Юи Хирасава", "assets/img/ui.jpg", "Not Info", Colors.green));
    Heroes.add(Human(
        "Цумуги Котобуки", "assets/img/mugi.jpg", "Not Info", Colors.blue));
    Heroes.add(
        Human("Мио Акияма", "assets/img/mio.jpg", "Not Info", Colors.orange));
    Heroes.add(
        Human("Рицу Тайнака", "assets/img/ritsu.jpg", "Not Info", Colors.pink));
  }

  final PageController controller =
      PageController(initialPage: 0, viewportFraction: 0.80);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemCount: Heroes.length,
      onPageChanged: (activ_card_number) {
        print("$activ_card_number");
        //context.
      },
      itemBuilder: (context, index) {
        return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 65),
            child: Card(
                elevation: 0.6,
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(Heroes[index].Path_Avatar),
                          fit: BoxFit.fitHeight),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: Container()),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              child: Text(
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                  Heroes[index].Name)),
                        ]))));
      },
    );
  }
}
