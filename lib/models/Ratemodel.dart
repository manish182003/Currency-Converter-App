// To parse this JSON data, do
//
//     final ratemodel = ratemodelFromJson(jsonString);

import 'dart:convert';

Ratemodel ratemodelFromJson(String str) => Ratemodel.fromJson(json.decode(str));

String ratemodelToJson(Ratemodel data) => json.encode(data.toJson());

class Ratemodel {
    String disclaimer;
    String license;
    int timestamp;
    String base;
    Map<String, double> rates;

    Ratemodel({
        required this.disclaimer,
        required this.license,
        required this.timestamp,
        required this.base,
        required this.rates,
    });

    factory Ratemodel.fromJson(Map<String, dynamic> json) => Ratemodel(
        disclaimer: json["disclaimer"],
        license: json["license"],
        timestamp: json["timestamp"],
        base: json["base"],
        rates: Map.from(json["rates"]).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "disclaimer": disclaimer,
        "license": license,
        "timestamp": timestamp,
        "base": base,
        "rates": Map.from(rates).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}
