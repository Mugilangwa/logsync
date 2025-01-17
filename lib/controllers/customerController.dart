

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:logisync_mobile/model/customer/request.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/customer/customer.dart';
import '../model/truck.dart';
import '../services/api_services.dart';
import '../shared/constants.dart';

class CustomerController extends ChangeNotifier{

JobRequest? jobRequest;
JobRequest? activeJobRequest;
 
List<TruckType> avilableTruckTypes = [];
String? selectedTruckTypeId;
String? selectedTruckTypeName;
String customerUsename = 'customer';
String? userType;
String? customerID;

 CustomerController(){
  initializer();
 }

   Future<void> initializer() async {
   await fetchTruckTypes();
   
   }

 Future<void> fetchTruckTypes() async {
  try {
    // Fetch the truck data from the API service
    var response = await ApiService.getTruckData();
    print(response);

    // Ensure the response is not null and contains data
    if (response != null && response.isNotEmpty) {
      avilableTruckTypes = response.map((data) => TruckType.fromJson(data)).toList();
      notifyListeners();
    } else {
      print("No trucks available.");
    }
  } catch (e) {
    print("Error fetching trucks: $e");
  }
}


Future<String> createJobRequest(JobRequest jobRequestPayload) async{

  const url = "${API_BASE_URL}JobRequest/CreateJobRequest";  
    
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(jobRequestPayload.toJson()),
      );

      if (response.statusCode == 200) {
        // Successfully submitted
        activeJobRequest = jobRequestPayload;
        notifyListeners();
        return 'Request sent successfully!';
      } 
      else {
        // Handle failure
        throw Exception('Failed to submit job request');
      }
    } catch (error) {
      // Handle error
      return 'Error: $error';
    }  
       
     
  }


 void setSelectedTruckTypeData(String truckTypeID ,String truckTypeName){

    selectedTruckTypeId= truckTypeID;
    selectedTruckTypeName = truckTypeName;
    notifyListeners();

    }
    

//method for login
Future<String> login(String email, String password) async {
  final loginUrl = Uri.parse("$API_BASE_URL/SecUser/Login");

  try {
    final response = await http.post(
      loginUrl,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // Extract user details
       customerUsename = data["data"]["email"];
       userType= data["data"]["role"];
       customerID = data["data"]["userID"];

      // Save data to shared preferences
      // await saveUserData(customerUsename, customerID);

      
     
 notifyListeners();
      return 
        'Login successful!';
        
      
    } else {
      final error = jsonDecode(response.body)['message'] ?? 'Unknown error';
      return  error;
    }
  } catch (e) {
         return   'failed';
  }
}

Future<void> saveUserData(String username, String customerId) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('username', username);
  await prefs.setString('customerId', customerId);
}

}













 