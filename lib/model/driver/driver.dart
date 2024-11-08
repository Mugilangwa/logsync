// ignore_for_file: non_constant_identifier_names

class Driver {
  final int? driver_id ;
  final String fullname;
  final  String email;
  final  int phonenumber;
  final String status;
  final String lecenceclass;
  final String lecencetype ;
  final String registration_comment;
  final String is_available_for;
  final String image_url;
  final String password;
  final DateTime dateCreated;

  Driver( {this.driver_id, required this.fullname,required this.email,required this.phonenumber,required this.status, required this.lecenceclass, required this.lecencetype, required this.registration_comment, required this.is_available_for,required this.image_url,required this.password, DateTime?dateCreated})
         : dateCreated = dateCreated ?? DateTime.now();

  
  factory Driver.fromJson(Map<String,dynamic>json)=> Driver(
      driver_id: json['driver_id'] as int?,
      fullname: json['fullname'] as String,
      email: json['email'] as String,
      phonenumber: json['phonenumber'] as int,
      status: json['status'] as String,
      lecenceclass: json['lecenceclass'] as String,
      lecencetype: json['lecencetype'] as String, 
      registration_comment: json['registration_comment'] as String,
      is_available_for: json['is_available_for'] as String,
      image_url: json['image_url'] as String,
      password: json['password'] as String,
      dateCreated:  DateTime.parse(json['dateCreated'] as String),
      
  );


  Map<String, dynamic> toJson() => {

      ' driver_id': driver_id,
      'fullname':fullname,
      'email':email,
      'phonenumber':phonenumber,
      'status':status,
      'lecenceclass':lecenceclass,
      'lecencetype':lecencetype,
      'registration_comment':registration_comment,
      'is_available_for':is_available_for,
      'image_url':image_url,
      'password':password,
      'dateCreated':dateCreated

  };
  
}