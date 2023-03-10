class Tasks {
  String? date;
  String? email;
  String? priority;
  String? status;
  String? tasks;
  String? time;
  String? key;

  Tasks(
      {this.key,
        this.date,
      this.email,
      this.priority,
      this.status,
      this.tasks,
      this.time});

  Tasks.fromJson(Map<String, dynamic> json) {
    key=json['key'];
    date = json['date'];
    email = json['email'];
    priority = json['priority'];
    status = json['status'];
    tasks = json['tasks'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['email'] = this.email;
    data['priority'] = this.priority;
    data['status'] = this.status;
    data['tasks'] = this.tasks;
    data['time'] = this.time;
    return data;
  }
}