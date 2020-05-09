import 'dart:convert';

Nota notaFromJson(String str) => Nota.fromJson(json.decode(str));

String notaToJson(Nota data) => json.encode(data.toJson());

class Nota {
  String key;
  String title;
  String detail;

  Nota({
    this.key,
    this.title,
    this.detail,
  });

  factory Nota.fromJson(Map<String, dynamic> json) => Nota(
        key: json["key"],
        title: json["title"],
        detail: json["detail"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "title": title,
        "detail": detail,
      };
}
