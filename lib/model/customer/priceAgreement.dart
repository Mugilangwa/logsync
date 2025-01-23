class PriceAgreement {
  final String priceAgreementID;
  final String? companyID;
  final String jobRequestID;
  final String? customerID;
  final double companyPrice;
   double customerPrice;
  final double agreedPrice;

  PriceAgreement({
    required this.priceAgreementID,
    this.companyID,
    required this.jobRequestID,
    this.customerID,
    required this.companyPrice,
    required this.customerPrice,
    required this.agreedPrice,
  });

  factory PriceAgreement.fromJson(Map<String, dynamic> json) {
    return PriceAgreement(
      priceAgreementID: json['priceAgreementID'],
      companyID: json['companyID'],
      jobRequestID: json['jobRequestID'],
      customerID: json['customerID'],
      companyPrice: json['companyPrice'].toDouble(),
      customerPrice: json['customerPrice'].toDouble(),
      agreedPrice: json['agreedPrice'].toDouble(),
    );
  }
}