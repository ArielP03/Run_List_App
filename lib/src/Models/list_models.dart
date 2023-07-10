class ListModel {
  
 // final fecha = DateTime.tryParse('$date');


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
        date: json["date"],
        tarea: json["tarea"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "date": date,
        "tarea": tarea,
      };
}
