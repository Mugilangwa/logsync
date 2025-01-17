import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:logisync_mobile/model/customer/customer.dart';
import 'package:logisync_mobile/model/driver/driver.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService extends ChangeNotifier {
 final String baseUrl = "http://softmaxafrica-001-site2.otempurl.com/api";
 
  
  //to save the username data 
  Future<void> saveUserData(String name) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_name',name);
    }

  Future<String> registerCustomer(CustomerModal customer) async{
   try{
    final response = await http.post(
     Uri.parse('$baseUrl/Customer/RegisterCustomer'),
     headers: {"Content-Type":"application/json"},
     body: jsonEncode(customer.toJson()),
     
    );

    if (response.statusCode == 200) {     
       final data = jsonDecode(response.body);
        final useName = data["data"]["fullName"];
        await saveUserData(useName);
         
       return "registration successfully!";
    }
    else{
      return "Error: ${response.statusCode} - ${response.body}";
    }
   }
   catch(e) {
    return "Error:$e";
   }

  }
 //registration for driver
  Future<String> registerDriver(DriverModal driver)async {
        try {
           final response = await http.post(
               Uri.parse('$baseUrl/Driver/RegisterDriver'),
               headers: {"ContentType": "multipart/form-data"},
               body: jsonEncode(driver.toJson())
                );
                if (response.statusCode==200) {
                  final data=jsonDecode(response.body);
                  final userName= data["data"]["fullName"];
                  await saveUserData(userName);
              return "Registration Succesfully!";
                  
                }
                else {
                   return "Error: ${response.statusCode} - ${response.body}";
                }
                
              } catch (e) {
                 return "Error:$e";
              }
  }

  //login for driver and Customer
   Future<Map<String, dynamic>> login(String email, String password) async {
   final loginUrl = Uri.parse("$baseUrl/SecUser/Login");

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
      final userName = data["data"]["email"];
      final token = data['token'];
      final role = data["data"]["role"];
      final customerId= data["data"]["userID"];
      // Assuming the role is in the response
    // Save user and token data for future use
      await saveUserData(userName,);

      return {
        'status': 'success',
        'user': CustomerModal.fromJson(data["data"]),
        'token': token,
        'role': role, 
        'customerID':customerId,
      };
    } 
    else 
    {
      final error = jsonDecode(response.body)['error'] ?? 'Unknown error';
      return {'status': 'failed', 'message': error};
    }
   } 
  catch (e) 
   {
    return {'status': 'failed', 'message': 'Error during login: $e'};
   }
 }

 //method for fetch trucks
 static Future<List<Map<String, dynamic>>?> getTruckData() async {
  final trucksUrl = Uri.parse('http://softmaxafrica-001-site2.otempurl.com/api/Company/GetAllTruckTypes');

  try {
    final response = await http.get(
      trucksUrl,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // Parse the JSON response
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      // Check if the 'data' field exists and is a list
      if (responseData['data'] != null && responseData['data'] is List) {
        return List<Map<String, dynamic>>.from(responseData['data']);
      } else {
        print('No truck data found in the response.');
        return [];
      }
    } else {
      print('Failed to load truck data: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print('Error fetching truck data: $e');
    return null;
  }
 }
}