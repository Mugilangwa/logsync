class Customer {
  final int? customerId ;
  final String fullname;
  final String email;
  final  int phonenumber;
  final  String address;
  final  String? paymentinfo;
  final  String password;
  final  String?cardnumber;
  final  String? cardtype;
  final  String? billingaddress;
  final  DateTime? expiredate;
  final  String? bankname;
  final  String? bankaccountnumber ;
  final  String? bankaccountholder;
  final  String? mobilenetwok;
  final  int? mobilenumber;
   final DateTime? dateCreated;

   
  Customer({this.cardnumber, this.cardtype, this.billingaddress, this.expiredate, this.bankname, this.bankaccountnumber, this.bankaccountholder, this.mobilenetwok, this.mobilenumber,this.customerId, required this.fullname, required this.email,required this.phonenumber, required this.address, this.paymentinfo, required this.password, DateTime? dateCreated} )
            : dateCreated= dateCreated?? DateTime.now();


factory Customer.fromJson(Map<String,dynamic> json) => Customer(
     customerId:json['customerId'] as int,
     fullname: json['fullname'] as String, 
     email: json['email'] as String,
     phonenumber: json['phonenumber'] as int,
     address: json['address'] as String,
     paymentinfo:json[' paymentinfo'] as String,
     password: json['password'] as String,
     cardnumber:json['cardnumber'] as String,
     cardtype:json['cardtype'] as String,
     billingaddress:json['billingaddress'] as String,
     expiredate:json['expiredate'] as DateTime,
     bankname:json['bankname'] as String,
     bankaccountnumber:json['bankaccountnumber'] as String,
     bankaccountholder:json[' bankaccountholder'] as String,
     mobilenumber:json['mobilenumberr'] as int,
     mobilenetwok:json['mobilenetwok'] as String,

     dateCreated: DateTime.parse(json['dateCreated'] as String)
     
     
     );


  Map<String ,dynamic> toJson() => {
     'customer_id': customerId,
     'fullname': fullname,
     'email': email,
     'phonenumber': phonenumber,
     'address': address,
    ' payment_info':paymentinfo,
     'password': password,
    'dateCreated': dateCreated,
    ' cardnumber': cardnumber,
     'cardtype': cardtype,
     'billingaddress': billingaddress,
     'expiredate': expiredate,
     ' bankname':  bankname,
     'bankaccountnumber': bankaccountnumber,
     'bankaccountholder': bankaccountholder,
     ' mobilenumber':  mobilenumber,
     ' mobilenetwok':  mobilenetwok,

  };


}