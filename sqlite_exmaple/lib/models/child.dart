class Child {
  int? id;
  String name;
  int age;

  Child({
    this.id,
    required this.name,
    required this.age,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  static Child fromMap(Map<String, dynamic> map) {
    return Child(
      id: map['id'],
      name: map['name'],
      age: map['age'],
    );
  }
}
