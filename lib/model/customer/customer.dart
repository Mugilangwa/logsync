class CustomerModal {
 
  final String fullName;
  final String email;
  final String phone;
  final String address;
  final String? paymentMethod;
  final String? cardNumber;
  final String? cardType;
  final String? billingAddress;
  final DateTime? expiryDate;
  final String? bankName;
  final String? bankAccountNumber;
  final String? bankAccountHolder;
  final String? mobileNetwork;
  final String? mobileNumber;
  final List<String>? companies;

  CustomerModal({
   
    required this.fullName,
    required this.email,
    required this.phone,
    required this.address,
    this.paymentMethod,
    this.cardNumber,
    this.cardType,
    this.billingAddress,
    this.expiryDate,
    this.bankName,
    this.bankAccountNumber,
    this.bankAccountHolder,
    this.mobileNetwork,
    this.mobileNumber,
    this.companies,
  });

  factory CustomerModal.fromJson(Map<String, dynamic> json) {
    return CustomerModal(
      
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      paymentMethod: json['paymentMethod'] as String?,
      cardNumber: json['cardNumber'] as String?,
      cardType: json['cardType'] as String?,
      billingAddress: json['billingAddress'] as String?,
      expiryDate: json['expiryDate'] != null
          ? DateTime.parse(json['expiryDate'])
          : null,
      bankName: json['bankName'] as String?,
      bankAccountNumber: json['bankAccountNumber'] as String?,
      bankAccountHolder: json['bankAccountHolder'] as String?,
      mobileNetwork: json['mobileNetwork'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      companies: (json['companies'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
     );
  }

  Map<String, dynamic> toJson() {
    return {
      
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'address': address,
      'paymentMethod': paymentMethod,
      'cardNumber': cardNumber,
      'cardType': cardType,
      'billingAddress': billingAddress,
      'expiryDate': expiryDate?.toIso8601String(),
      'bankName': bankName,
      'bankAccountNumber': bankAccountNumber,
      'bankAccountHolder': bankAccountHolder,
      'mobileNetwork': mobileNetwork,
      'mobileNumber': mobileNumber,
      'companies': companies,
    };
  }
}
