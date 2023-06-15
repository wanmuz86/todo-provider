class Todo {
  final String name;
  final String? description;
  final String? place;

  Todo({required this.name, this.description, this.place});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'place': place,
      'description': description,
    };
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      name: json['name'],
      place: json['place'],
      description: json['description'],
    );
  }
}

