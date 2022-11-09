class PageModel {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  Author? author;
  List<Data>? data;

  PageModel(
      {this.page,
      this.perPage,
      this.total,
      this.totalPages,
      this.author,
      this.data});

  factory PageModel.fromJson(Map<String, dynamic> parsedJson) {
    List list = parsedJson['data'];
    List<Data> data = list.map((i) => Data.fromJson(i)).toList();

    return PageModel(
        page: parsedJson['page'],
        perPage: parsedJson['per_page'],
        total: parsedJson['total'],
        totalPages: parsedJson['total_pages'],
        author: Author.fromJson(parsedJson['author']),
        data: data);
  }
}

class Author {
  String? firstName;
  String? lastName;

  Author({this.firstName, this.lastName});

  factory Author.fromJson(Map<String, dynamic> parsedJson) {
    return Author(
      firstName: parsedJson['first_name'],
      lastName: parsedJson['last_name'],
    );
  }
}

class Data {
  int? id;
  String? first_name;
  String? last_name;
  String? avatar;
  List<Image>? Images;
  Data({
    this.id,
    this.first_name,
    this.last_name,
    this.avatar,
    this.Images,
  });

  factory Data.fromJson(Map<String, dynamic> parsedJson) {
    List list = parsedJson['images'];
    List<Image> images = list.map((e) => Image.fromJson(e)).toList();
    return Data(
        id: parsedJson['id'],
        first_name: parsedJson['first_name'],
        last_name: parsedJson['last_name'],
        avatar: parsedJson['avatar'],
        Images: images);
  }
}

class Image {
  int? id;
  String? imageName;
  Image({
    this.id,
    this.imageName,
  });

  factory Image.fromJson(Map<String, dynamic> parsejson) {
    return Image(id: parsejson['id'], imageName: parsejson['imageName']);
  }
}
