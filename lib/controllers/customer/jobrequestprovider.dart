import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:logisync_mobile/model/customer/request.dart';

class JobRequestProvider extends ChangeNotifier {
  String pickupLocation = '';
  String dropLocation = '';
  String referenceNumber = '';
  String cargoDescription = '';
  String truckType = '';

  bool isSubmitting = false;

  // Set truck type
  void setTruckType(String type) {
    truckType = type;
    notifyListeners();
  }

  // Set pickup location
  void setPickupLocation(String location) {
    pickupLocation = location;
    notifyListeners();
  }

  // Set drop location
  void setDropLocation(String location) {
    dropLocation = location;
    notifyListeners();
  }

  // Set reference number
  void setReferenceNumber(String number) {
    referenceNumber = number;
    notifyListeners();
  }

  // Set cargo description
  void setCargoDescription(String description) {
    cargoDescription = description;
    notifyListeners();
  }
  
  // //method of selecting the trucks
  //    //my exist state variables
  //    List<Truck> _trucks = [];
  //    String? _selectedTruckId;
  //    String? _selectedTruckName;

  //    List<Truck> get trucks => _trucks;
  //    String? get selectedTruckId => _selectedTruckId;
  //    String? get selectedTruckName => _selectedTruckName;

  //method for fetch truckdata
   
//  Future<void> fetchTrucks() async {
//   try {
//     // Fetch the truck data from the API service
//     var response = await ApiService.getTruckData();
//     print(response);

//     // Ensure the response is not null and contains data
//     if (response != null && response.isNotEmpty) {
//       _trucks = response.map((data) => Truck.fromJson(data)).toList();
//       notifyListeners();
//     } else {
//       print("No trucks available.");
//     }
//   } catch (e) {
//     print("Error fetching trucks: $e");
//   }
// }
//method to set selecte items in truckdata
  // void setSelectedData(String truckID ,String truckName){
  //   _selectedTruckId=truckID;
  //   _selectedTruckName = truckName ;
  //   notifyListeners();
  //   }



  // Submit Job Request to API
  Future<String> submitJobRequest(JobRequest jobRequest) async {
    isSubmitting = true;
    notifyListeners();

     const url = "http://softmaxafrica-001-site2.otempurl.com/api/JobRequest/CreateJobRequest";  
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(jobRequest.toJson()),
      );

      if (response.statusCode == 200) {
        // Successfully submitted
        return 'Request sent successfully!';
      } 
      else {
        // Handle failure
        throw Exception('Failed to submit job request');
      }
    } catch (error) {
      // Handle error
      return 'Error: $error';
    } finally {
      isSubmitting = false;
      notifyListeners();
    }
  }
}
