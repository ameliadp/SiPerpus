// To parse this JSON data, do
//
//     final totalFine = totalFineFromJson(jsonString);

import 'dart:convert';

TotalFine totalFineFromJson(String str) => TotalFine.fromJson(json.decode(str));

String totalFineToJson(TotalFine data) => json.encode(data.toJson());

class TotalFine {
  final int? totalFine;

  TotalFine({
    this.totalFine,
  });

  factory TotalFine.fromJson(Map<String, dynamic> json) => TotalFine(
        totalFine: json["total_fine"],
      );

  Map<String, dynamic> toJson() => {
        "total_fine": totalFine,
      };
}
