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
  final double agreedPrice;

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
      priceAgreementID: json['priceAgreementID'],
      companyID: json['companyID'],
      jobRequestID: json['jobRequestID'],
      customerID: json['customerID'],
      companyPrice: json['companyPrice']?.toDouble() ?? 0.0,
      customerPrice: json['customerPrice']?.toDouble() ?? 0.0,
      agreedPrice: json['agreedPrice']?.toDouble() ?? 0.0,
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
  final PriceAgreement priceAgreement;
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
  final Customer customer;
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
    required this.priceAgreement,
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
    required this.customer,
    this.invoiceDetails,
  });

  factory ActiveRequest.fromJson(Map<String, dynamic> json) {
    return ActiveRequest(
      jobRequestID: json['jobRequestID'],
      assignedCompany: json['assignedCompany'],
      pickupLocation: json['pickupLocation'],
      deliveryLocation: json['deliveryLocation'],
      cargoDescription: json['cargoDescription'],
      containerNumber: json['containerNumber'],
      requestType: json['requestType'],
      status: json['status'],
      priceAgreementID: json['priceAgreementID'],
      priceAgreement: PriceAgreement.fromJson(json['priceAgreement']),
      negotiations: (json['negotiations'] as List<dynamic>)
          .map((e) => Negotiation.fromJson(e as Map<String, dynamic>))
          .toList(),
      truckType: json['truckType'],
      truckID: json['truckID'],
      cdate: DateTime.parse(json['cdate']),
      udate: json['udate'] != null ? DateTime.parse(json['udate']) : null,
      firstDepositAmount: json['firstDepositAmount']?.toDouble(),
      companyAdvanceAmountRequred:
          json['companyAdvanceAmountRequred']?.toDouble(),
      contractId: json['contractId'],
      invoiceNumber: json['invoiceNumber'],
      truck: json['truck'],
      driverID: json['driverID'],
      driver: json['driver'],
      customerID: json['customerID'],
      customer: Customer.fromJson(json['customer']),
      invoiceDetails: json['invoiceDetails'],
    );
  }
}
