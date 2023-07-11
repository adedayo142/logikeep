import 'dart:convert';

List<Countries> countriesFromJson(String str) =>
    List<Countries>.from(json.decode(str).map((x) => Countries.fromJson(x)));

String countriesToJson(Countries data) => json.encode(data.toJson());

class Countries {
  final int id;
  final String name;

  Countries({required this.id, required this.name});

  factory Countries.fromJson(Map<String, dynamic> json) =>
      Countries(id: json['id'], name: json['name']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
