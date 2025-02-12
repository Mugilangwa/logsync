import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:logisync_mobile/model/customer/company.dart';
import 'package:logisync_mobile/model/customer/request.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../model/customer/jobRequest.dart';
import '../model/truck.dart';
import '../services/api_services.dart';
import '../shared/constants.dart';


class CustomerController extends ChangeNotifier {
  List<ActiveRequest>listOfCompanyReplied =[];
  List<ActiveRequest> listOfJobsRequested = [];
  ActiveRequest? activeRequest;
  ActiveRequest? jobOnNegotiation;
  JobRequest? jobRequest;
  JobRequest? activeJobRequest;
  List<TruckType> availableTruckTypes = [];
  List<Negotiation> listOfNegotiations = [];
  String? selectedTruckTypeId;
  String? selectedTruckTypeName;
  String? customerUsername;
  String? userType;
  String? customerID;
  bool isLoading = false;

  LatLng? currentCustomerLocation;
  late GoogleMapController mapController;
  LocationData? currentLocation;
  final Location locationService = Location();
  bool serviceEnabled = false;
  PermissionStatus? permissionGranted;

//variables in pricenegotiatians

bool showInputField = false;
bool isVisible = false;
bool isChecked = false;
bool isAgree = false;

//valiable fro company
Company? allCompany ;


  CustomerController() {
    _initialize();
  }

  Future<void> _initialize() async {
    await loadUserData();
    await fetchTruckTypes();
  }

  // Check login status
  void checkLoginStatus(BuildContext context) async {
    final checkIsLoggedIn = await isLoggedIn();
    if (!checkIsLoggedIn ) {
      GoRouter.of(context).go('/account/login');
    }
  }

  // Load user data from shared preferences
  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    customerUsername = prefs.getString('username');
    customerID = prefs.getString('customerID');
    notifyListeners();
  }

  // Save user session
  Future<void> saveUserSession(String username, String customerId) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
    prefs.setString('customerID', customerId);
    prefs.setBool('isLoggedIn', true);
  }

  // Clear session data
  Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  // Check if user is logged in
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  // Fetch truck types
  Future<void> fetchTruckTypes() async {
    try {
      final response = await ApiService.getTruckData();
      if (response != null && response.isNotEmpty) {
        availableTruckTypes =
            response.map((data) => TruckType.fromJson(data)).toList();
        notifyListeners();
      } else {
        print("No trucks available.");
      }
    } catch (e) {
      print("Error fetching trucks: $e");
    }
  }

  // Set selected truck type
  void setSelectedTruckTypeData(String truckTypeID, String truckTypeName) {
    selectedTruckTypeId = truckTypeID;
    selectedTruckTypeName = truckTypeName;
    notifyListeners();
  }

  // Create job request
  Future<String> createJobRequest(JobRequest jobRequestPayload) async {
    const url = "${API_BASE_URL}JobRequest/CreateJobRequest";

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(jobRequestPayload.toJson()),
      );

      if (response.statusCode == 200) {
        activeJobRequest = jobRequestPayload;
        notifyListeners();
        return 'Request sent successfully!';
      } else {
        throw Exception('Failed to submit job request');
      }
    } catch (error) {
      return 'Error: $error';
    }
  }

  // Login
  Future<void> login(String email, String password, BuildContext context) async {
    final loginUrl = Uri.parse("$API_BASE_URL/SecUser/Login");

    try {
      final response = await http.post(
        loginUrl,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        customerID = data["data"]["userID"];
        userType = data["data"]["role"];
        customerUsername = data["data"]["email"];
        await saveUserSession(customerUsername!, customerID!);

        if (userType == "CUSTOMER") {
          GoRouter.of(context).go('/customer/Home');
        } else if (userType == "DRIVER") {
          GoRouter.of(context).go('/driver/Home');
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Welcome back! $customerUsername"),
            duration: const Duration(seconds: 4),
          ),
        );
      notifyListeners();
      } else {
        final error = jsonDecode(response.body)['message'] ?? 'Unknown error';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error during login: $error"),
            duration: const Duration(seconds: 4),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error during login: $e"),
          duration: const Duration(seconds: 4),
        ),
      );
    }
  }

  // Get customer job requests
  Future<void> getCustomerJobRequest(String customerID) async {
    if(isLoading) return;
    isLoading= true;
    
    final url = Uri.parse('$API_BASE_URL/JobRequest/GetCustomerJobRequest/$customerID');

    try {
      final response = await http.get(
        url,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
       // Print the JSON data before decoding

        final data = jsonDecode(response.body)['data'] as List;
          
        listOfJobsRequested = data.map((job) => ActiveRequest.fromJson(job)).toList();
        
        notifyListeners();
      } else {
        print('Failed to fetch job requests. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
    finally {
      isLoading=false;
      notifyListeners();
    }
    
  }
// get customer location
Future<void> getLocationUpdates() async {
    bool serviceEnabled = await locationService.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await locationService.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
    PermissionStatus permissionGranted = await locationService.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await locationService.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationService.onLocationChanged.listen((LocationData currentLocation) {
      if (currentLocation.latitude != null && currentLocation.longitude != null) {
         currentCustomerLocation = LatLng(currentLocation.latitude!, currentLocation.longitude!);
        // updateRoute();
        updateCameraPosition(currentCustomerLocation as LocationData);
       
        notifyListeners();
      }
    });

    notifyListeners();
  
  }
 Future<void> updateCameraPosition(LocationData locationData) async {
    if (locationData.latitude != null && locationData.longitude != null) {
      final GoogleMapController controller = mapController;
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(locationData.latitude!, locationData.longitude!),
            zoom: 18,
            tilt: 60.0,
            bearing: 180.0,
          ),
        ),
      );
    }
    notifyListeners();
  }

  //get the jobrequest by id in negotiate
  Future<ActiveRequest?> getJobRequestById(String jobRequestID) async {
  // Notify UI about loading state

  final url = Uri.parse('$API_BASE_URL/JobRequest/GetJobRequestById/$jobRequestID');
  
  try {
    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      final data = responseBody['data']; // Ensure 'data' contains the job request
      print(data);
      if (data is Map) {
        ActiveRequest activeJobRequest = ActiveRequest.fromJson(data as Map<String, dynamic>);
        print(activeJobRequest);
        notifyListeners();
        return activeJobRequest; // Return the parsed object
      } else {
        print('Unexpected data format: $data');
        return null;
      }
    } else {
      print('Failed to fetch job request. Status code: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print('Error occurred: $e');
    return null;
  } 
}


  //method to setjobrequestid during negotiation
  void setJobRequestID(String jobRequestID) {
   jobRequestID = jobRequestID;
    notifyListeners();
  }

// updatejob request
  Future<String> updateJobRequestByJobrequestId(JobRequest jobRequestPayload)  async {
    final url = "${API_BASE_URL}JobRequest/UpdateJobRequest/${jobRequestPayload.jobRequestID}";
    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(jobRequestPayload.toJson()),
      );

      if (response.statusCode == 200) {
        activeJobRequest = jobRequestPayload;
        notifyListeners();
        return 'success';
      } else {
        throw Exception('Failed to submit job request');
      }
    } catch (error) {
      return 'Error: $error';
    }
  }

  void setActiveRequest(ActiveRequest job) {
    jobOnNegotiation = job;
    notifyListeners();
  
  }
   //methods in pricenegotiations 
    void toggleNegotiationField() {    
      showInputField = !showInputField;
       
       isVisible= !isVisible;
       notifyListeners();
       }
     void toggleIsChecked() {    
      
       isChecked = ! isChecked;
       notifyListeners();
       }
     void toggleIsAgree() {    
      
       isAgree = !isAgree;
       ;
       notifyListeners();
       }
    
  //method to get the all company
   Future<void> getAllCompany( String companyId) async{
    if(isLoading) return;
    isLoading= true;
     print('ndani ya method $companyId');
    final uri = '${API_BASE_URL}Company/GetCompanyById/$companyId';

    try {
      final response= await http.get(
        Uri.parse(uri),          
        headers: {'Content-Type': 'application/json'},
        );

        if (response.statusCode == 200) {
           final responceBody = jsonDecode(response.body);
           final data= responceBody["data"];
           
           allCompany= Company.fromJson(data as Map<String, dynamic>);
          
          notifyListeners();
        }

        else{
          print("fail to load company${response.statusCode}");
        }
      
    } catch (error) {
      print('Error: $error');
   }
   finally {
    isLoading= false;
   }
   
   }

   //to delete request
   Future<String> deleteActiveRequest(String jobRequestID) async {
  final uri = '${API_BASE_URL}JobRequest/DeleteJobRequest/$jobRequestID';

  try {
    final response = await http.delete(
      Uri.parse(uri),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      jsonDecode(response.body);
      notifyListeners();
      return 'Request deleted successfully!';
    } else {
      print('Failed to delete request. Status code: ${response.statusCode}');
      return 'Failed to delete request. Status code: ${response.statusCode}';
    }
  } catch (error) {
    print('Error: $error');
    return 'Error: $error';
  }
}
   
}