// ignore_for_file: public_member_api_docs, sort_constructors_first
/**{
    "id": "0001",
    "type": ["donut", "bread-cake"],
    "name": "Cake",
    "ppu": 0.55,
    "batters": { "id": "1001", "type": "Regular" }
  }
   */

class Bakery {
  String? id;
  List<String>? type;
  String? name;
  double? ppu;
  Batters? batters;
  Bakery({
    this.id,
    this.type,
    this.name,
    this.ppu,
    this.batters,
  });
  factory Bakery.fromJson(Map<String, dynamic> json) {
    List<String> type = List.from(json['type']);
    return Bakery(
        id: json['id'],
        type: type,
        name: json['name'],
        ppu: json['ppu'],
        batters: Batters.fromJson(json['batters']));
  }
}

class Batters {
  String? bid;
  String? btype;
  Batters({
    this.bid,
    this.btype,
  });
  factory Batters.fromJson(Map<String, dynamic> json) {
    return Batters(bid: json['bid'], btype: json['btype']);
  }
}
