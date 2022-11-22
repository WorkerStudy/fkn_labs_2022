//Содержит в себе информацию о героях
class Human {
  final int id;
  final String name;
  final String urlImg;
  final String info;

  Human({
    required this.id,
    required this.name,
    required this.urlImg,
    required this.info,
  });

  factory Human.fromJson(Map<String, dynamic> response) {
    return Human(
        id: response['id'],
        name: response['name'],
        urlImg: response['thumbnail']['path'] +
            "." +
            response['thumbnail']['extension'],
        info: response['description']);
  }
}
