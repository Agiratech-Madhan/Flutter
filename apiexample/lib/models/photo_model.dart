// ignore_for_file: public_member_api_docs, sort_constructors_first
/**[
    {
      "albumId": 1,
      "id": 1,
      "title": "accusamus beatae ad facilis cum similique qui sunt",
      "url": "http://placehold.it/600/92c952",
      "thumbnailUrl": "http://placehold.it/150/92c952"
    },
     */
class Photos {
  List<Photo>? photos;
  Photos({
    this.photos,
  });
  factory Photos.fromJson(List<dynamic> json) {
    List<Photo> photos = json.map((e) => Photo.fromJson(e)).toList();

    return Photos(photos: photos);
  }
}

class Photo {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;
  Photo({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });
  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
        albumId: json['albumId'],
        id: json['id'],
        title: json['title'],
        url: json['url'],
        thumbnailUrl: json['thumbnailUrl']);
  }
}
