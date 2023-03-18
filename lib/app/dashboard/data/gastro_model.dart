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
}
