class Customer {
  final int? customerId ;
  final String fullname;
  final String email;
  final  int phonenumber;
  final  String address;
  final  String paymentinfo;
  final  String password;
   final DateTime? dateCreated;

   
  Customer({ this.customerId, required this.fullname, required this.email,required this.phonenumber, required this.address, required this.paymentinfo, required this.password, DateTime? dateCreated} )
            : dateCreated= dateCreated?? DateTime.now();


factory Customer.fromJson(Map<String,dynamic> json) => Customer(
     customerId:json['customerId'] as int,
     fullname: json['fullname'] as String, 
     email: json['email'] as String,
     phonenumber: json['phonenumber'] as int,
     address: json['address'] as String,
     paymentinfo:json[' paymentinfo'] as String,
     password: json['password'] as String,
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
    'dateCreated': dateCreated

  };


}