class TruckType {
  final String truckTypeID;
  final String typeName;
  final String description;
  final String sampleImageUrl;

  TruckType({
    required this.truckTypeID,
    required this.typeName,
    required this.description,
    required this.sampleImageUrl,
  });

  factory TruckType.fromJson(Map<String, dynamic> json) {
    return TruckType(
      truckTypeID: json['truckTypeID'],
      typeName: json['typeName'],
      description: json['description'],
      sampleImageUrl: json['sampleImageUrl'],
    );
  }
}
