

class Company {
  final String companyID;
  final String companyTinNumber;
  final String companyName;
  final String adminFullName;
  final String adminEmail;
  final String adminContact;
  final String companyAddress;
  final String? companyDescription;
  final double companyLatitude;
  final double companyLongitude;

  Company({
    required this.companyID,
    required this.companyTinNumber,
    required this.companyName,
    required this.adminFullName,
    required this.adminEmail,
    required this.adminContact,
    required this.companyAddress,
    this.companyDescription,
    required this.companyLatitude,
    required this.companyLongitude,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      companyID: json['companyID'],
      companyTinNumber: json['companyTinNumber'],
      companyName: json['companyName'],
      adminFullName: json['adminFullName'],
      adminEmail: json['adminEmail'],
      adminContact: json['adminContact'],
      companyAddress: json['companyAddress'],
      companyDescription: json['companyDescription'],
      companyLatitude: (json['companyLatitude'] as num).toDouble(),
      companyLongitude: (json['companyLongitude'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'companyID': companyID,
      'companyTinNumber': companyTinNumber,
      'companyName': companyName,
      'adminFullName': adminFullName,
      'adminEmail': adminEmail,
      'adminContact': adminContact,
      'companyAddress': companyAddress,
      'companyDescription': companyDescription,
      'companyLatitude': companyLatitude,
      'companyLongitude': companyLongitude,
    };
  }

  
}
