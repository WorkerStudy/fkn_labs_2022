import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'list_heroes.dart';
import 'human.dart';

void main() {
  //InfoHeroesNetWork().requestListHeroes(5);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppFirst();
  }
}

class MyAppFirst extends State<MyApp> {
  Color _BG_Color_Widget = Colors.blue;

  @override
  initState() {
    super.initState();
    print("Конструктор");
  }

  @override
  Widget build(BuildContext context) {
    var listIdHeroes = Provider.of<List<int>?>(context);
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.grey,
          appBar: null,
          body: MultiProvider(
              providers: [
                ChangeNotifierProvider<IdHumanProvider>(
                    create: (context) => IdHumanProvider(5)),
                ChangeNotifierProvider<HumanProvider>(
                    create: (context) => HumanProvider()),
              ],
              child: Stack(fit: StackFit.expand, children: <Widget>[
                CustomPaint(
                    size: const Size(200, 200),
                    painter: DrawTriangle(figColor: _BG_Color_Widget)),
                Column(children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 65, vertical: 35),
                      child: Image.asset(
                        "assets/logo/logo.png",
                        height: 90,
                        width: 350,
                      )),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Text(
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        "Выбери своего героя"),
                  ),
                  Container(child: Expanded(child: ListHeroes()))
                ]),
              ]))),
    );
  }
}

//Для того чтобы нарисовать треугольник
class DrawTriangle extends CustomPainter {
  var figColor;

  DrawTriangle({required this.figColor});

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.moveTo(size.width, size.width);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();
    canvas.drawPath(path, Paint()..color = figColor);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
