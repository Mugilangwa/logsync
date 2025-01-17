class JobRequest {
  String? jobRequestID = '';
  String pickupLocation = 'Default Pickup Location';
  String deliveryLocation = 'Default Delivery Location';
  String cargoDescription = 'Default Cargo Description';
  String? containerNumber = '';
  String? status = '';
  String? priceAgreementID = '';
  String? truckType ;
  String? truckID ="";
  String? driverID = '';
  String? requestType = 'Default Request Type';
  String? customerID ;
  double? requestedPrice = 0.0;
  double? customerPrice = 0.0;
  double? acceptedPrice = 0.0;
  String? companyID = '';
  String? contractId = '';
  double? companyAdvanceAmountRequired = 0.0;
  double? firstDepositAmount = 0.0;

  // Constructor
  JobRequest( {
    this.jobRequestID ="",
    this.pickupLocation = 'Default Pickup Location',
    this.deliveryLocation = 'Default Delivery Location',
    this.cargoDescription = 'Default Cargo Description',
    this.containerNumber ="",
    this.status = '',
    this.priceAgreementID = "",
    required this.truckType,
    this.truckID="",
    this.driverID ,
    this.requestType = 'Default Request Type',
   required this.customerID ,
    this.requestedPrice = 0.0,
    this.customerPrice = 0.0,
    this.acceptedPrice = 0.0,
    this.companyID = "",
    this.contractId ="",
    this.companyAdvanceAmountRequired = 0.0,
    this.firstDepositAmount = 0.0,
  });

  // From JSON to JobRequest object
  factory JobRequest.fromJson(Map<String, dynamic> json) {
    return JobRequest(
      jobRequestID: json['jobRequestID'],
      pickupLocation: json['pickupLocation'] ?? 'Default Pickup Location',
      deliveryLocation: json['deliveryLocation'] ?? 'Default Delivery Location',
      cargoDescription: json['cargoDescription'] ?? 'Default Cargo Description',
      containerNumber: json['containerNumber'],
      status: json['status'] ?? 'Pending',
      priceAgreementID: json['priceAgreementID'],
      truckType: json['truckType'] ?? 'Default Truck Type',
      truckID: json['truckID'],
      driverID: json['driverID'],
      requestType: json['requestType'] ?? 'Default Request Type',
      customerID: json['customerID'],
      requestedPrice: json['requestedPrice']?.toDouble() ?? 0.0,
      customerPrice: json['customerPrice']?.toDouble() ?? 0.0,
      acceptedPrice: json['acceptedPrice']?.toDouble() ?? 0.0,
      companyID: json['companyID'],
      contractId: json['contractId'],
      companyAdvanceAmountRequired: json['companyAdvanceAmountRequred']?.toDouble() ?? 0.0,
      firstDepositAmount: json['firstDepositAmount']?.toDouble() ?? 0.0,
    );
  }

  // From JobRequest object to JSON
  Map<String, dynamic> toJson() {
    return {
      'jobRequestID': jobRequestID,
      'pickupLocation': pickupLocation,
      'deliveryLocation': deliveryLocation,
      'cargoDescription': cargoDescription,
      'containerNumber': containerNumber,
      'status': status,
      'priceAgreementID': priceAgreementID,
      'truckType': truckType,
      'truckID': truckID,
      'driverID': driverID,
      'requestType': requestType,
      'customerID': customerID,
      'requestedPrice': requestedPrice,
      'customerPrice': customerPrice,
      'acceptedPrice': acceptedPrice,
      'companyID': companyID,
      'contractId': contractId,
      'companyAdvanceAmountRequred': companyAdvanceAmountRequired,
      'firstDepositAmount': firstDepositAmount,
    };
  }
}
