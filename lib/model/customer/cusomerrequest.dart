class Customer {
  final String customerID;
  final String fullName;
  final String email;
  final String phone;
  final String address;
  final String paymentMethod;
  final String? cardNumber;
  final String? cardType;
  final String? billingAddress;
  final String? expiryDate;
  final String? bankName;
  final String? bankAccountNumber;
  final String? bankAccountHolder;
  final String? mobileNetwork;
  final String? mobileNumber;

  Customer({
    required this.customerID,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.address,
    required this.paymentMethod,
    this.cardNumber,
    this.cardType,
    this.billingAddress,
    this.expiryDate,
    this.bankName,
    this.bankAccountNumber,
    this.bankAccountHolder,
    this.mobileNetwork,
    this.mobileNumber,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      customerID: json['customerID'],
      fullName: json['fullName'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      paymentMethod: json['paymentMethod'],
      cardNumber: json['cardNumber'],
      cardType: json['cardType'],
      billingAddress: json['billingAddress'],
      expiryDate: json['expiryDate'],
      bankName: json['bankName'],
      bankAccountNumber: json['bankAccountNumber'],
      bankAccountHolder: json['bankAccountHolder'],
      mobileNetwork: json['mobileNetwork'],
      mobileNumber: json['mobileNumber'],
    );
  }
}