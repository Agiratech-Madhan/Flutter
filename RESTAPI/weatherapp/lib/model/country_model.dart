// ignore_for_file: public_member_api_docs, sort_constructors_first
// class CountryData {
//   String? status;
//   int? statusCode;
//   String? version;
//   String? access;
//   Data? data;

//   CountryData(
//       {this.status, this.statusCode, this.version, this.access, this.data});

//   factory CountryData.fromJson(Map<String, dynamic> json) {
//     return CountryData(
//         status: json['status'],
//         statusCode: json['status-code'],
//         version: json['version'],
//         access: json['access'],
//         data: json['data'] != null ? Data.fromJson(json['data']) : null);
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['status'] = status;
//     data['status-code'] = statusCode;
//     data['version'] = version;
//     data['access'] = access;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   List<Counties>? counties;

//   Data({this.counties});

//   factory Data.fromJson(Map<String, dynamic> json) {
//     List<Counties> data = List.from(json['countries']);
//     return Data(counties: data);
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     if (counties != null) {
//       data['counties'] = counties!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Counties {
//   String? country;
//   String? region;

//   Counties({country, region});

//   factory Counties.fromJson(Map<String, dynamic> json) {
//     return Counties(country: json['country'], region: json['region']);
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['country'] = country;
//     data['region'] = region;
//     return data;
//   }
// }
class Counties {
  List<Country>? data;

  Counties({this.data});

  factory Counties.fromJson(Map<String, dynamic> json) {
    List coun = List.from(json['data']);
    List<Country> datas = coun
        .map(
          (e) => Country.fromJson(e),
        )
        .toList();

    return Counties(data: datas);
  }

  Map<String, dynamic> toJson() => {
        'data': data,
      };
}

class Country {
  String? country;

  Country({
    this.country,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      country: json['country'],
    );
  }

  Map<String, dynamic> toJson() => {
        'country': country,
      };
}
