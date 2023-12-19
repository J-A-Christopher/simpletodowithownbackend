class Todos {
  int? id;
  DateTime? createTime;
  String? title;
  String? description;
  Completed? completed;

  Todos(
      {this.id, this.createTime, this.title, this.description, this.completed});

  Todos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createTime = json['create_time'];
    title = json['title'];
    description = json['description'];
    completed = json['completed'] != null
        ? new Completed.fromJson(json['completed'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['create_time'] = this.createTime;
    data['title'] = this.title;
    data['description'] = this.description;
    if (this.completed != null) {
      data['completed'] = this.completed!.toJson();
    }
    return data;
  }
}

class Completed {
  String? type;
  List<int>? data;

  Completed({this.type, this.data});

  Completed.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    data = json['data'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['data'] = this.data;
    return data;
  }
}




