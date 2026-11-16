class NotesModel {
  final String id;
  final String title;
  final String description;
  final String category;
  final DateTime  createdAt;

  NotesModel({required this.id, required this.title, required this.description, required this.category, required this.createdAt});

  NotesModel copyWith({
  String? title,
  String? description,
  String? category,

}){
    return NotesModel(
        id: id,
        title: title ?? this.title,
        description: description ?? this.description,
        category: category ?? this.category,
        createdAt: createdAt
    );
  }
}