/**{
    "city": "Mumbai",
    "streets": [
      "address1",
      "address2"
    ]
} */
class Address {
  String? city;
  List<String>? streets;
  Address({
    this.city,
    this.streets,
  });
  factory Address.fromJson(Map<String, dynamic> json) {
    List<String> addresslist = List.from(json['streets']);
    print('${Address(city: json['city'], streets: addresslist)}');
    return Address(city: json['city'], streets: addresslist);
  }
}
