import 'dart:convert';

class User {
  User({
    required this.name,
    required this.iCard,
    required this.address,
    required this.city,
    required this.country,
    required this.mobile,
    this.picture,
    this.id,
  });

  String name;
  String iCard;
  String address;
  String city;
  String country;
  String mobile;
  String? picture;
  String? id;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        name: json["name"],
        iCard: json["iCard"],
        address: json["address"],
        city: json["city"],
        country: json["country"],
        mobile: json["mobile"],
        picture: json["picture"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "iCard": iCard,
        "address": address,
        "city": city,
        "country": country,
        "mobile": mobile,
        "picture": picture,
      };

  User copy() => User(
        name: this.name,
        iCard: this.iCard,
        address: this.address,
        city: this.city,
        country: this.country,
        mobile: this.mobile,
        picture: this.picture,
        id: this.id,
      );
}
