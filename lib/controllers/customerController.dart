

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logisync_mobile/model/customer/request.dart';
import 'package:http/http.dart' as http;
import 'package:logisync_mobile/shared/session_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
Future<void> login(String email, String password, BuildContext context) async {
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
        // Extract details from response
       customerID = data["data"]["userID"];
       userType = data["data"]["role"];    
       customerUsename = data["data"]["email"];
              // Save data to shared preferences
       await saveUserSession(customerUsename, data["data"]["userID"]);

               // Navigate based on role
        if (userType == "CUSTOMER") {
         GoRouter.of(context).go('/customer/Home');
        } else if (userType == "DRIVER") {
         GoRouter.of(context).go('/driver/Home');
        } 
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("welcome again! $customerUsename"),duration: Duration(seconds: 4),),
      );
      notifyListeners();
       
    } 
    else {
      final error = jsonDecode(response.body)['message'] ?? 'Unknown error';
      ScaffoldMessenger.of(error).showSnackBar(
        SnackBar(content: Text("Error during login: $error"),duration: Duration(minutes: 1)),
      );
    }
  } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error during login: $e"),duration: Duration(minutes: 1)),
      );  
  }
}


//method of save session

static Future<void> saveUserSession(String username, String customerId) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('username', username);
  prefs.setString('customerId', customerId);
  prefs.setBool('isLoggedIn', true);

}
//method for clear usersession data
static Future<void>clearSession() async {
  final prefs =await SharedPreferences.getInstance();
  prefs.clear();
}

static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }





}













 