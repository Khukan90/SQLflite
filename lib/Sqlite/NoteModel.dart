class NoteModel {
  final int? id;
  final String title;
  final String email;
  final int age;
  final String description;

  NoteModel(
      {this.id,
      required this.title,
      required this.email,
      required this.age,
      required this.description});

  NoteModel.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        title = res['title'],
        email = res['email'],
        age = res['age'],
        description = res['description'];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'title': title,
      'email': email,
      'age': age,
      'description': description,
    };
  }
}
