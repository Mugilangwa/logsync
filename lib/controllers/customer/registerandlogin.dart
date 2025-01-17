import 'package:flutter/material.dart';
import 'package:logisync_mobile/model/customer/customer.dart';
import 'package:logisync_mobile/services/api_services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginAndRegisterController extends ChangeNotifier {
  
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final ApiService __apiService = ApiService();
  String?  _role;
  String _username='Customer';
  String? _customerId;
  CustomerModal? _user;
  bool _isLoading = false;


  String get username => _username;
  String? get customerId => _customerId;
  String? get role => _role;
  CustomerModal? get user => _user;
  bool get isLoading => _isLoading;

  Future<String> login(BuildContext context, String email, String password) async {
    _isLoading = true;
    notifyListeners();
    final response = await __apiService.login(email, password);
     if (response['status'] == 'success') {
       _user = response['user'] as CustomerModal?;
       _username=response['username'];
       _customerId= response['customerId'];
      await _storage.write(key:'customer_id', value:_customerId);
      _isLoading = false;
      notifyListeners();

      getSavedCustomerName(_username);
      getRole(response['role']);
      return  'Login successful!';
    }
       else{
      _isLoading = false;
      notifyListeners();
      return "Login failed: ${response['message']}";
    }
  }

   // Method to get the saved customer ID
  Future<String?> getSavedCustomerId() async {
    _customerId = await _storage.read(key: 'customer_id');
    notifyListeners();
    return _customerId;

  }
  void getSavedCustomerName(username) async {
    _customerId = username;
    notifyListeners();
      }

   void getRole(role) async {
     _role= role;
    notifyListeners();
      }

  // Method to clear data on logout
  Future<void> logout() async {
    _customerId = null;
    _username ;
    await _storage.delete(key: 'customer_id');
    notifyListeners();
  }
}
