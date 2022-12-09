// ignore_for_file: public_member_api_docs, sort_constructors_first
/**{
    "id": 19995,
    "results": [
        {
            "iso_639_1": "en",
            "iso_3166_1": "US",
            "name": "Back for a Limited Time",
            "key": "LgZ2MDuJvhc", 
            */

class Videos {
  final int id;
  final List<VideoData> item;
  Videos({
    required this.id,
    required this.item,
  });
  factory Videos.fromJson(Map<String, dynamic> json) {
    List videos = json['results'];
    List<VideoData> moviesData =
        videos.map((e) => VideoData.fromJson(e)).toList();
    return Videos(item: moviesData, id: json['id']);
  }
}

class VideoData {
  final String keyValue;
  VideoData({required this.keyValue});
  factory VideoData.fromJson(Map<String, dynamic> json) {
    return VideoData(keyValue: json['key']);
  }
}
