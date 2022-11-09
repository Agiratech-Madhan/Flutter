class Student {
  int? id;
  String? name;
  String? imageURL;
  String? studentScores;

  Student({this.id, this.name, this.imageURL, this.studentScores});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageURL = json['imageUrl'];
    studentScores = json['studentScores'];
  }
}
