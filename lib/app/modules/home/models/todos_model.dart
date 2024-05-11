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

  // emptyTodosModel
  static TodosModel empty() {
    return TodosModel(
      userId: 0,
      id: 0,
      title: '',
      completed: false,
    );
  }

  static List<TodosModel> fromJsonList(data) {
    List<TodosModel> todosList = [];
    for (var item in data) {
      todosList.add(TodosModel.fromJson(item));
    }
    return todosList;
  }

  @override
  String toString() {
    return 'TodosModel(userId: $userId, id: $id, title: $title, completed: $completed)';
  }
}
