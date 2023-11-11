class Task {
  late String name, deathDate, notes, isComplete;
  int? id;

  Task(this.id, this.name, this.deathDate, this.notes, this.isComplete);

  factory Task.fromJson(Map<String, dynamic> parsedJson) {
    return Task(parsedJson['id'], parsedJson['name'], parsedJson['deathDate'],
        parsedJson['notes'], parsedJson['isComplete']);
  }
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = id;
    map['name'] = name;
    map['deathDate'] = deathDate;
    map['notes'] = notes;
    map['isComplete'] = isComplete;
    return map;
  }
}
