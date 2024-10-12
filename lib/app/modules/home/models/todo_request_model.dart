class TodoRequestModel {
  String title;
  String description;
  int userId;
  bool completed;

  TodoRequestModel({
    required this.title,
    required this.description,
    required this.userId,
    required this.completed,
  });

  factory TodoRequestModel.fromJson(Map<String, dynamic> json) {
    return TodoRequestModel(
      title: json['title'],
      description: json['description'],
      userId: json['userId'],
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['userId'] = userId;
    data['completed'] = completed;
    return data;
  }

  @override
  String toString() {
    return 'TodoRequestModel(title: $title, description: $description, userId: $userId, completed: $completed)';
  }
}
