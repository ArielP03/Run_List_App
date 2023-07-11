class ListModel {
  int id;
  String name;
  String date;
  String tarea;

  ListModel({
    required this.id,
    required this.name,
    required this.date,
    required this.tarea,
  });

  factory ListModel.fromJson(Map<String, dynamic> json) => ListModel(
        id: json["id"],
        name: json["name"],
        tarea: json["tarea"],
        date: json["date"]
      );

  Map<String, dynamic> toMap(Map map) => {
        'id':id,
        'name':name,
        'tarea':tarea,
        'date':date
      };
}
