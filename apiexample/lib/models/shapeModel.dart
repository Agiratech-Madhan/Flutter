// ignore_for_file: public_member_api_docs, sort_constructors_first
/**{
  "shape_name":"rectangle",
  "property":{
    "width":5.0,
    "breadth":10.0
  }
} */

class Shape {
  String? shape_name;
  Property? property;
  Shape({
    this.shape_name,
    this.property,
  });
  factory Shape.fromJson(Map<String, dynamic> json) {
    return Shape(
        shape_name: json['shape_name'],
        property: Property.fromJson(json['property']));
  }
}

class Property {
  double? width;
  double? breadth;
  Property({
    this.width,
    this.breadth,
  });
  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(width: json['width'], breadth: json['breadth']);
  }
}
