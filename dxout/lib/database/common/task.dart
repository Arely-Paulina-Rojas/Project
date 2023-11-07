class Task {
  late String name;
  int? id;
  late String deathDate;

  Task(this.id, this.name, this.deathDate);

  factory Task.fromJson(Map<String, dynamic> parsedJson) {
    return Task(parsedJson['id'], parsedJson['name'], parsedJson['deathDate']);
  }
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = id;
    map['name'] = name;
    map['date'] = deathDate;
    return map;
  }
}
