class TodosModel {
  int userId;
  int id;
  String title;
  bool completed;

  TodosModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory TodosModel.fromJson(Map<String, dynamic> json) {
    return TodosModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }

  TodosModel copyWith({
    int? userId,
    int? id,
    String? title,
    bool? completed,
  }) {
    return TodosModel(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }

  @override
  String toString() {
    return 'TodosModel(userId: $userId, id: $id, title: $title, completed: $completed)';
  }
}