class DriverModal {
  final String fullName;
  final String email;
  final String phone;
  final String licenseNumber;
  final String? status; // Auto-filled by database
  final String? registrationComment; // Auto-filled by database
  final String licenseClasses;
  final DateTime? licenseExpireDate;
  final bool? isAvailableForBooking; // Auto-filled by database
  final String? imageUrl;
  final String password;
  final DateTime dateCreated;

  DriverModal({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.licenseNumber,
    this.status, // Optional since it's auto-filled
    this.registrationComment, // Optional since it's auto-filled
    required this.licenseClasses,
    required this.licenseExpireDate,
    this.isAvailableForBooking, // Optional since it's auto-filled
    this.imageUrl, // Optional
    required this.password,
    DateTime? dateCreated, // Default to current date if not provided
  }) : dateCreated = dateCreated ?? DateTime.now();

  // Factory method to create an instance from JSON
  factory DriverModal.fromJson(Map<String, dynamic> json) => DriverModal(
        fullName: json['FullName'] as String,
        email: json['Email'] as String,
        phone: json['Phone'] as String,
        licenseNumber: json['LicenseNumber'] as String,
        status: json['Status'] as String?,
        registrationComment: json['RegstrationComment'] as String?,
        licenseClasses: json['LicenseClasses'] as String,
        licenseExpireDate: json['LicenseExpireDate'] != null
            ? DateTime.parse(json['LicenseExpireDate'] as String)
            : null,
        isAvailableForBooking: json['isAvilableForBooking'] as bool?,
        imageUrl: json['ImageUrl'] as String?,
        password: json['Password'] as String,
        dateCreated: DateTime.parse(json['DateCreated'] as String),
      );

  // Convert an instance to JSON
  Map<String, dynamic> toJson() => {
        'FullName': fullName,
        'Email': email,
        'Phone': phone,
        'LicenseNumber': licenseNumber,
        'Status': status, // Omit if null
        'RegstrationComment': registrationComment, // Omit if null
        'LicenseClasses': licenseClasses,
        'LicenseExpireDate': licenseExpireDate?.toIso8601String(),
        'isAvilableForBooking': isAvailableForBooking, // Omit if null
        'ImageUrl': imageUrl, // Omit if null
        'Password': password,
        'DateCreated': dateCreated.toIso8601String(),
      };
}
