import 'package:flutter/material.dart';
import 'list_heroes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppFirst();
  }
}

class MyAppFirst extends State<MyApp> {
  Color _BG_Color_Widget = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.grey,
            appBar: null,
            body: Stack(fit: StackFit.expand, children: <Widget>[
              CustomPaint(
                  size: Size(200, 200),
                  painter: DrawTriangle(figColor: _BG_Color_Widget)),
              Column(children: [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 65, vertical: 35),
                    child: Image.asset(
                      "assets/logo/logo.png",
                      height: 90,
                      width: 350,
                    )),
                Padding(
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
            ])));
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
