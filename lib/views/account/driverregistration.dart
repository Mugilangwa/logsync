
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logisync_mobile/model/driver/driver.dart';
import 'package:logisync_mobile/services/api_services.dart';
import 'package:logisync_mobile/views/customer/current.dart';
import 'package:intl/intl.dart';
class DriverRegistration extends StatefulWidget {
  const DriverRegistration({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _DriverregistrationState createState() => _DriverregistrationState();
}

class _DriverregistrationState extends State<DriverRegistration> {
  final _registerFormKey = GlobalKey<FormState>();   
   final TextEditingController  _fullName = TextEditingController();  
  final TextEditingController _email = TextEditingController();
  final TextEditingController  _lecencenumber = TextEditingController(); 
  final TextEditingController _phonenumber= TextEditingController();  
  final TextEditingController _password= TextEditingController();
  final TextEditingController _comfirmpassword= TextEditingController();
    final TextEditingController _lecenceExpireDate= TextEditingController();
  
  
  String? _selectedValue;
  late String _classtypeValue = 'Class A';
  final ApiService _apiService= ApiService();


   Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        _lecenceExpireDate.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

void _submitForm() async {
  final driver = DriverModal(
    fullName: _fullName.text,
    email: _email.text,
    phone: _phonenumber.text,
    licenseNumber: _lecencenumber.text,   
    licenseClasses: _classtypeValue,
    password: _password.text,  
    imageUrl: 'dani/asasd.jpeg', 
    licenseExpireDate:DateTime.parse(_lecenceExpireDate.text),
  );

  // Call the API service to register the driver
  String response = await _apiService.registerDriver(driver);

  // Parse response to determine if registration was successful
  if (response == "Registration successful!") { 
    // Show success dialog
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text("Registration Results"),
        content: const Text("Registration successful!"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              context.go('/Drivers/home'); // Redirect to the home page
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  } else {
    // Show error dialog
    showDialog(
      context: context,
      builder: (msg) => AlertDialog(
        title: const Text("Registration Results"),
        content: Text(response), // Display error message from the API
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(msg).pop(); // Close the dialog
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor:  Colors.white,
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 1, vertical: 16),
                child: Center(
                    child: Image.asset(
                  'assets/icon/driver.png',
                )),
              )),
          Expanded(
            flex: 8,
            child: ScrollConfiguration(
              behavior: NoScrollbarBehavior(),
              child: SingleChildScrollView(
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30), // Space before the form

                    // Form Container
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Form(
                          key: _registerFormKey,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                TextFormField(
                                  controller: _fullName,
                                  decoration: InputDecoration(
                                      labelText: 'Full Name',
                                      filled: true,
                                      fillColor: Colors.grey[200],
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: Colors.purple),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 20, horizontal: 20),
                                      prefixIcon: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Image.asset(
                                            'assets/icon/user.png', // Your icon image path
                                            height: 20,
                                            width: 20,
                                          )
                                          )
                                          ),
                                           validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Your full name ';
                                    }
                                    
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 15),
                                TextFormField(
                                  controller: _email,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      labelText: 'Email',
                                      filled: true,
                                      fillColor: Colors.grey[200],
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: Colors.purple),
                                      ),
                                     
                                      contentPadding:

                                          const EdgeInsets.symmetric(
                                              vertical: 20, horizontal: 20),
                                      prefixIcon: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Image.asset(
                                            'assets/icons/email.png', // Your icon image path
                                            height: 20,
                                            width: 20,
                                          ))),
                                validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Your email ';
                                    }
                                    
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 15),
                                TextFormField(
                                  controller: _phonenumber,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      labelText: 'Phone Number',
                                      filled: true,
                                      fillColor: Colors.grey[200],
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: Colors.purple),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 20, horizontal: 20),
                                      prefixIcon: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Image.asset(
                                            'assets/icons/phone.png', // Your icon image path
                                            height: 20,
                                            width: 20,
                                          ),
                                          
                                          )
                                          ),
                                          validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Your phonenumber ';
                                    }
                                    
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 15),
                                DropdownButtonFormField<String>(
                                  value: _selectedValue,
                                  hint: const Text('select'),
                                  items: <String>[
                                    'Single',
                                    'marriage',
                                    'Student'
                                  ].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _selectedValue = newValue!;
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please select an martial status';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      labelText: 'Select..',
                                      filled: true,
                                      fillColor: Colors.grey[200],
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: Colors.purple),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 20, horizontal: 20),
                                      prefixIcon: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Image.asset(
                                            'assets/icons/email.png', // Your icon image path
                                            height: 20,
                                            width: 20,
                                          ))),
                                ),
                                const SizedBox(height: 15),
                                DropdownButtonFormField<String>(
                                  value: _classtypeValue,
                                  hint: const Text('Lecence Class'),
                                  items: <String>[
                                    'Class A',
                                    'Class B',
                                    'Class C',
                                    'Class D',
                                    'Class E',
                                  ].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _classtypeValue = newValue!;
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please select an option';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      labelText: 'Choose Option',
                                      filled: true,
                                      fillColor: Colors.grey[200],
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: Colors.purple),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 20, horizontal: 20),
                                      prefixIcon: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Image.asset(
                                            'assets/icons/email.png', // Your icon image path
                                            height: 20,
                                            width: 20,
                                          ))
                                          ),
                                ),
                                const SizedBox(height: 15),
                                TextFormField(
                                  controller: _lecencenumber,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      labelText: 'Lecence Number',
                                      filled: true,
                                      fillColor: Colors.grey[200],
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: Colors.purple),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 20, horizontal: 20),
                                      prefixIcon: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Image.asset(
                                            'assets/icon/cash-on-delivery.png', // Your icon image path
                                            height: 20,
                                            width: 20,
                                          ))
                                          ),
                                          validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your lecence number';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 15),
                                TextFormField(
                                  controller: _lecenceExpireDate,
                                  onTap:() =>_selectDate(context),
                                  keyboardType: TextInputType.datetime,
                                  decoration: InputDecoration(
                                      labelText: 'Lecence Expiredate',
                                      filled: true,
                                      fillColor: Colors.grey[200],
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: Colors.purple),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 20, horizontal: 20),
                                      prefixIcon: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Image.asset(
                                            'assets/icon/cash-on-delivery.png', // Your icon image path
                                            height: 20,
                                            width: 20,
                                          ))
                                          ),
                                          validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your expiredate';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 15),
                                TextFormField(
                                  controller: _password,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      labelText: 'Password',
                                      filled: true,
                                      fillColor: Colors.grey[200],
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: Colors.purple),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 20, horizontal: 20),
                                      suffixIcon:
                                          const Icon(Icons.visibility_off),
                                      prefixIcon: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Image.asset(
                                            'assets/icon/3d-unlocked.png', // Your icon image path
                                            height: 20,
                                            width: 20,
                                          ))),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Your Password';
                                    }
                                    if(value.length < 8){
                                      return 'Your password must contains atleast 7 characters!';
                                    }
                                    return null;
                                  },
                                ),
                                 const SizedBox(height: 15),
                                TextFormField(
                                  controller: _comfirmpassword,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    labelText: 'Confirm Password',
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                       borderSide: const BorderSide(color: Colors.purple),                                  
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 20),
                                    suffixIcon: const Icon(Icons.visibility_off),
                                    prefixIcon: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Image.asset(
                                      'assets/icon/3d-unlocked.png', // Your icon image path
                                      height: 20,
                                      width: 20,
                                    )
                                    )
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Comfirm Your Password';
                                    }
                                    if(value != _password.text){
                                      return'Your password does not match';
                                    }
                                    return null;
                                  },
                                ),
                                
                                const SizedBox(height: 30),
                                Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if(_registerFormKey.currentState!.validate()){
                                    _submitForm();
                                       
                                      }
                                      
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 80, vertical: 20),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      backgroundColor: Colors.purple,
                                    ),
                                    child: const Text(
                                      "SIGN UP",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color.fromARGB(
                                              210, 247, 246, 240)),
                                    ),
                                  ),

                                ),
                                const SizedBox(height: 20),
                                Center(
                                  child: InkWell(
                                    onTap: () {
                                      context.go('/account/login');
                                    },
                                    child: const Text(
                                      'Already Have Account? Login Here',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ])),
                    ),
                  ],
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
