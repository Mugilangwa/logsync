import 'package:logisync_mobile/model/customer/cusomerrequest.dart';
import 'package:logisync_mobile/model/customer/priceAgreement.dart';

// Define the Negotiation model
class Negotiation {
  final String priceAgreementID;
  final String? companyID;
  final String jobRequestID;
  final String customerID;
  final double companyPrice;
  final double customerPrice;
   double agreedPrice;

  Negotiation({
    required this.priceAgreementID,
    this.companyID,
    required this.jobRequestID,
    required this.customerID,
    required this.companyPrice,
    required this.customerPrice,
    required this.agreedPrice,
  });

  factory Negotiation.fromJson(Map<String, dynamic> json) {
    return Negotiation(
      priceAgreementID: json['priceAgreementID']?.toString() ?? '',
      companyID: json['companyID']?.toString(), // Allow null
      jobRequestID: json['jobRequestID']?.toString() ?? '',
      customerID: json['customerID']?.toString() ?? '',
      companyPrice: (json['companyPrice'] ?? 0).toDouble(),
      customerPrice: (json['customerPrice'] ?? 0).toDouble(),
      agreedPrice: (json['agreedPrice'] ?? 0).toDouble(),
    );
  }
}
class ActiveRequest {
  final String jobRequestID;
  final String? assignedCompany;
  final String pickupLocation;
  final String deliveryLocation;
  final String cargoDescription;
  final String? containerNumber;
  final String requestType;
  final String status;
  final String priceAgreementID;
  final PriceAgreement? priceAgreement;
  final List<Negotiation> negotiations;
  final String truckType;
  final String? truckID;
  final DateTime cdate;
  final DateTime? udate;
  final double? firstDepositAmount;
  final double? companyAdvanceAmountRequred;
  final String? contractId;
  final String? invoiceNumber;
  final dynamic truck;
  final String? driverID;
  final dynamic driver;
  final String customerID;
  final Customer? customer;
  final dynamic invoiceDetails;

  ActiveRequest({
    required this.jobRequestID,
    this.assignedCompany,
    required this.pickupLocation,
    required this.deliveryLocation,
    required this.cargoDescription,
    this.containerNumber,
    required this.requestType,
    required this.status,
    required this.priceAgreementID,
    this.priceAgreement,
    required this.negotiations,
    required this.truckType,
    this.truckID,
    required this.cdate,
    this.udate,
    this.firstDepositAmount,
    this.companyAdvanceAmountRequred,
    this.contractId,
    this.invoiceNumber,
    this.truck,
    this.driverID,
    this.driver,
    required this.customerID,
    this.customer,
    this.invoiceDetails,
  });

  factory ActiveRequest.fromJson(Map<String, dynamic> json) {
    return ActiveRequest(
      jobRequestID: json['jobRequestID']?.toString() ?? '',
      assignedCompany: json['assignedCompany']?.toString(),
      pickupLocation: json['pickupLocation']?.toString() ?? '',
      deliveryLocation: json['deliveryLocation']?.toString() ?? '',
      cargoDescription: json['cargoDescription']?.toString() ?? '',
      containerNumber: json['containerNumber']?.toString(),
      requestType: json['requestType']?.toString() ?? '',
      status: json['status']?.toString() ?? '',
      priceAgreementID: json['priceAgreementID']?.toString() ?? '',
      priceAgreement: json['priceAgreement'] != null
          ? PriceAgreement.fromJson(json['priceAgreement'])
          : null,
      negotiations: (json['negotiations'] as List<dynamic>?)
              ?.map((e) => Negotiation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      truckType: json['truckType']?.toString() ?? '',
      truckID: json['truckID']?.toString(),
      cdate: DateTime.tryParse(json['cdate']?.toString() ?? '') ?? DateTime.now(),
      udate: json['udate'] != null ? DateTime.tryParse(json['udate'].toString()) : null,
      firstDepositAmount: (json['firstDepositAmount'] ?? 0).toDouble(),
      companyAdvanceAmountRequred: (json['companyAdvanceAmountRequred'] ?? 0).toDouble(),
      contractId: json['contractId']?.toString(),
      invoiceNumber: json['invoiceNumber']?.toString(),
      truck: json['truck'],
      driverID: json['driverID']?.toString(),
      driver: json['driver'],
      customerID: json['customerID']?.toString() ?? '',
      customer: json['customer'] != null ? Customer.fromJson(json['customer']) : null,
      invoiceDetails: json['invoiceDetails'],
    );
  }
}
