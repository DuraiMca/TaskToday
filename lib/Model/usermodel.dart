class Task {
  final String? email;
  final String? status;
  final String? date;
  final String? time;
  final String? priority;
  final String? task;

  Task({
    this.email,
    this.status,
    this.date,
    this.time,
    this.priority,
    this.task,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      email: json['email'],
      status: json['status'],
      date: json['date'],
      time: json['time'],
      priority: json['priority'],
      task: json['task'],
    );
  }
}

class TaskData {
  final String? id;
  final List<Task>? tasks;

  TaskData({
    this.id,
    this.tasks,
  });

  factory TaskData.fromJson(Map<String, dynamic> json) {
    var list = json['tasks'] as List;
    List<Task> tasksList = list.map((i) => Task.fromJson(i)).toList();

    return TaskData(
      id: json['id'],
      tasks: tasksList,
    );
  }
}

class Category {
  final String categoryImage;
  final String categoryTitle;

  Category(
    this.categoryImage,
    this.categoryTitle,
  );
}
