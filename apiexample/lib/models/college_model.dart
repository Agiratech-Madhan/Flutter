// ignore_for_file: public_member_api_docs, sort_constructors_first
/**{
    "name": "Pooja",
    "majors":["CS", "Maths"],
    "subjects": [
      {
      "subjectName": "math",
      "teacher":"Ms S"
      },
      {
        "subjectName": "science",
        "teacher":"Ms P"
      }
      ]
  } */
class College {
  String? name;
  List<String>? majors;
  List<Subjects>? subjects;

  College({
    this.name,
    this.majors,
    this.subjects,
  });
  factory College.fomJson(Map<String, dynamic> json) {
    List<String> list = List.from(json['majors']);
    List sublist = List.from(json['subjects']);
    List<Subjects> sublists = sublist
        .map(
          (e) => Subjects.fromjson(e),
        )
        .toList();
    return College(name: json['name'], majors: list, subjects: sublists);
  }
}

class Subjects {
  String? subjectName;
  String? teacher;
  Subjects({
    this.subjectName,
    this.teacher,
  });
  factory Subjects.fromjson(Map<String, dynamic> json) {
    return Subjects(subjectName: json['subjectName'], teacher: json['teacher']);
  }
}
