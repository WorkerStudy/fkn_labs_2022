import 'package:flutter/material.dart';

//Содержит в себе информацию о героях
class Human {
  String Name = "";
  String Path_Avatar = "";
  String Info = "";
  var Fig_Colors = Colors.green;
  Human(var SetName, var SetPath, var SetInfo, var Set_Color) {
    this.Name = SetName;
    this.Path_Avatar = SetPath;
    this.Info = SetInfo;
    this.Fig_Colors = Set_Color;
  }
}
