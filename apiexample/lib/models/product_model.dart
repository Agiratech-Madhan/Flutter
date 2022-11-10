// ignore_for_file: public_member_api_docs, sort_constructors_first
/**{
    "id":1,
    "name":"ProductName",
    "images":[
      {
        "id":11,
        "imageName":"xCh-rhy"
      },
      {
        "id":31,
        "imageName":"fjs-eun"
      }
    ]
} */
class Product {
  int? id;
  String? name;
  List<Images>? images;
  Product({
    this.id,
    this.name,
    this.images,
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    List image = json['images'];
    List<Images> images_ = image.map((e) => Images.fromjson(e)).toList();
    return Product(id: json['id'], name: json['name'], images: images_);
  }
}

class Images {
  int? id;
  String? imageName;
  Images({
    this.id,
    this.imageName,
  });
  factory Images.fromjson(Map<String, dynamic> json) {
    return Images(id: json['id'], imageName: json['imageName']);
  }
}
