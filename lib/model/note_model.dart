class NoteModel {
  final int? id;
  final String title;
  final String description;
  final DateTime createdAT;

  const NoteModel({
    this.id,
    required this.title,
    required this.description,
    required this.createdAT
  });

  Map<String, Object?> toMap() {
    return {
      'title': title,
      'description': description,
      'dateTime' : createdAT.toString()
    };
  }



}