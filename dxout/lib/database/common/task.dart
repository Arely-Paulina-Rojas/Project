class Task {
  late String name;
  int? id;
  late bool isComplete;
  late String deathDate;

  Task(this.id, this.name, this.deathDate, this.isComplete);

  factory Task.fromJson(Map<String, dynamic> parsedJson) {
    return Task(parsedJson['id'], parsedJson['name'], parsedJson['deathDate'],
        parsedJson['isComplete']);
  }
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = id;
    map['name'] = name;
    map['date'] = deathDate;
    map['isComplete'] = isComplete;
    return map;
  }
}
