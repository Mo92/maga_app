import 'dart:convert';

class GastroModel {
  GastroModel({
    required this.name,
    required this.street,
    required this.houseNr,
    required this.postalCode,
    required this.city,
    required this.distance,
    required this.queue,
    required this.averageWaitingTime,
    required this.backgroundImageUrl,
  });

  final String name;
  final String street;
  final String houseNr;
  final int postalCode;
  final String city;
  final String distance;
  final int queue;
  final String averageWaitingTime;
  final String backgroundImageUrl;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'street': street,
      'houseNr': houseNr,
      'postalCode': postalCode,
      'city': city,
      'distance': distance,
      'queue': queue,
      'averageWaitingTime': averageWaitingTime,
      'backgroundImageUrl': backgroundImageUrl,
    };
  }

  factory GastroModel.fromMap(Map<String, dynamic> map) {
    return GastroModel(
      name: map['name'] as String,
      street: map['street'] as String,
      houseNr: map['houseNr'] as String,
      postalCode: map['postalCode'] as int,
      city: map['city'] as String,
      distance: map['distance'] as String,
      queue: map['queue'] as int,
      averageWaitingTime: map['averageWaitingTime'] as String,
      backgroundImageUrl: map['backgroundImageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GastroModel.fromJson(String source) =>
      GastroModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
