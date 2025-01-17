import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logisync_mobile/views/customer/current.dart';
import '../../services/api_services.dart';
import '../../model/customer/customer.dart';

// ignore: must_be_immutable

class CustomerRegistation extends StatefulWidget {
  const CustomerRegistation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomerRegistationState createState() => _CustomerRegistationState();
}

class _CustomerRegistationState extends State<CustomerRegistation> {
  final _registerFormKey = GlobalKey<FormState>();
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _bankaccountnumber = TextEditingController();
  final TextEditingController _bankaccountholder = TextEditingController();
  final TextEditingController _billingaddress = TextEditingController();
  final TextEditingController _mobilenumber = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _phonenumber = TextEditingController();
  final TextEditingController _cardnumber = TextEditingController();
  final TextEditingController _expireDate = TextEditingController();
  //final TextEditingController _password = TextEditingController();
 // final TextEditingController _comfirmpassword = TextEditingController();

  String?_selectedpayment = "Cash";
  String? _banknames;
  String? _mobilelist;
  String? _cardType;

  final ApiService _apiService = ApiService();

 Future<void> _submitForm() async {
   
    if (_registerFormKey.currentState!.validate()) {
      final customer = CustomerModal(
        fullName: _fullName.text,
        email: _email.text,
        phone: _phonenumber.text, // Now a String
        address: _address.text,
        paymentMethod: _selectedpayment, // Nullable field
        cardNumber: _cardnumber.text.isNotEmpty ? _cardnumber.text : null,
        cardType: _cardType, // Nullable field
        billingAddress:_billingaddress.text.isNotEmpty ? _billingaddress.text : null,
        expiryDate: _expireDate.text.isNotEmpty? DateTime.tryParse(_expireDate.text): null, // Safely parse DateTime
        bankName: _banknames, // Nullable field
        bankAccountNumber:_bankaccountnumber.text.isNotEmpty ? _bankaccountnumber.text : null,
        bankAccountHolder:_bankaccountholder.text.isNotEmpty ? _bankaccountholder.text : null,
        mobileNumber: _mobilenumber.text.isNotEmpty? _mobilenumber.text: null, // Now a String
        mobileNetwork: _mobilelist, // Nullable field
        companies: [], // Default empty list; update as needed
      );

      String response = await _apiService.registerCustomer(customer);
     
     if (response== 'registration successfully!' ) {
        
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content:Text(response ,
                style: const TextStyle(color: Colors.black,fontSize: 15),),
                duration:const Duration(seconds: 3),
                backgroundColor: Colors.green,
                 )
               );
              
              
              
               
              
        context.go('/customer/home');
     }
     else{       
      showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text("Registration Results"),
                content: Text(response),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.of(ctx).pop(),
                      child: const Text("OK"))
           ],
         )
         );
       }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
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
                    const SizedBox(height: 10), // Space before the form

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
                                //fullname
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
                                          ))),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Your fullname ';
                                    }

                                    return null;
                                  },
                                ),
                                const SizedBox(height: 15),
                                //email
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
                                      return 'Please Enter Your email';
                                    }

                                    return null;
                                  },
                                ),
                                const SizedBox(height: 15),
                                //Phone Number
                                TextFormField(
                                  controller: _phonenumber,
                                  keyboardType: TextInputType.phone,
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
                                          ))),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Your phonenumber ';
                                    }

                                    return null;
                                  },
                                ),
                                const SizedBox(height: 15),
                                //Address
                                TextFormField(
                                  controller: _address,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      labelText: 'Address',
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
                                            'assets/icons/location.png', // Your icon image path
                                            height: 20,
                                            width: 20,
                                          ))),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Your address ';
                                    }

                                    return null;
                                  },
                                ),
                                const SizedBox(height: 15),
                                // paymentinfo
                                DropdownButtonFormField(
                                  value: _selectedpayment,
                                  hint: const Text('Select '),
                                  items: <String>[
                                    'Cash',
                                    'Credit Card',
                                    'Bank Transfer',
                                    'Mobile Netwoks',
                                  ].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _selectedpayment = newValue!;
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return ('please select a choise');
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      labelText: 'Payment Method',
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
                                          ))),
                                ),
                                const SizedBox(height: 15),

                                //  for credit card
                                if (_selectedpayment == 'Credit Card') ...[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50, vertical: 5),
                                    child: Column(
                                      children: [
                                        //Card Number
                                        TextFormField(
                                          controller: _cardnumber,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              labelText: 'Card Number',
                                              filled: true,
                                              fillColor: Colors.grey[200],
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                borderSide: const BorderSide(
                                                    color: Colors.purple),
                                              ),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 20,
                                                      horizontal: 20),
                                              prefixIcon: Padding(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: Image.asset(
                                                    'assets/icon/computer.png', // Your icon image path
                                                    height: 20,
                                                    width: 20,
                                                  ))),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please Enter Your Account Number';
                                            }
                                            return null;
                                          },
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        // cardtype,
                                        DropdownButtonFormField(
                                          value: _cardType,
                                          hint: const Text(
                                              'Select your Card Type'),
                                          items: <String>[
                                            'Visa',
                                            'Master Card',
                                          ].map((String value) {
                                            return DropdownMenuItem(
                                                value: value,
                                                child: Text(value));
                                          }).toList(),
                                          onChanged: (String? value) {
                                            setState(() {
                                              value = _cardType;
                                            });
                                          },
                                          decoration: InputDecoration(
                                              labelText: 'Card Type',
                                              filled: true,
                                              fillColor: Colors.grey[200],
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                borderSide: const BorderSide(
                                                    color: Colors.purple),
                                              ),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 20,
                                                      horizontal: 20),
                                              prefixIcon: Padding(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: Image.asset(
                                                    'assets/icon/atm-card.png', // Your icon image path
                                                    height: 20,
                                                    width: 20,
                                                  ))),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please Enter Your Card type';
                                            }
                                            return null;
                                          },
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        //Billing Address
                                        TextFormField(
                                          controller: _billingaddress,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                              labelText: 'Billing Address',
                                              filled: true,
                                              fillColor: Colors.grey[200],
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                borderSide: const BorderSide(
                                                    color: Colors.purple),
                                              ),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 20,
                                                      horizontal: 20),
                                              prefixIcon: Padding(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: Image.asset(
                                                    'assets/icon/atm-card.png', // Your icon image path
                                                    height: 20,
                                                    width: 20,
                                                  ))),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please Enter Your Account Number';
                                            }
                                            return null;
                                          },
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        //Expire Date
                                        TextFormField(
                                          controller: _expireDate,
                                          keyboardType: TextInputType.datetime,
                                          decoration: InputDecoration(
                                              labelText: 'Expire Date',
                                              filled: true,
                                              fillColor: Colors.grey[200],
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                borderSide: const BorderSide(
                                                    color: Colors.purple),
                                              ),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 20,
                                                      horizontal: 20),
                                              prefixIcon: const Padding(
                                                  padding: EdgeInsets.all(12.0),
                                                  child:
                                                      Icon(Icons.date_range))),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please Enter Your Account Number';
                                            }
                                            return null;
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ]

                                // for bank transfer
                                else if (_selectedpayment ==
                                    'Bank Transfer') ...[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50, vertical: 5),
                                    child: Column(
                                      children: [
                                        DropdownButtonFormField(
                                          value: _banknames,
                                          hint: const Text('Select Bank Name'),
                                          items: <String>[
                                            'NMB',
                                            'CRDB',
                                            'NBC',
                                            'ABSA',
                                            'BOA',
                                          ].map((String values) {
                                            return DropdownMenuItem(
                                                value: values,
                                                child: Text(values));
                                          }).toList(),
                                          onChanged: (String? value) {
                                            setState(() {
                                              value = _banknames;
                                            });
                                          },
                                          decoration: InputDecoration(
                                              labelText: 'Bank Name',
                                              filled: true,
                                              fillColor: Colors.grey[200],
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                borderSide: const BorderSide(
                                                    color: Colors.purple),
                                              ),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 20,
                                                      horizontal: 20),
                                              prefixIcon: Padding(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: Image.asset(
                                                    'assets/icon/transference.png', // Your icon image path
                                                    height: 20,
                                                    width: 20,
                                                  ))),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please Enter Your bank Name';
                                            }
                                            return null;
                                          },
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        //bank Account number
                                        TextFormField(
                                          controller: _bankaccountnumber,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              labelText: 'bank Account',
                                              filled: true,
                                              fillColor: Colors.grey[200],
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                borderSide: const BorderSide(
                                                    color: Colors.purple),
                                              ),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 20,
                                                      horizontal: 20),
                                              prefixIcon: Padding(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: Image.asset(
                                                    'assets/icon/computer.png', // Your icon image path
                                                    height: 20,
                                                    width: 20,
                                                  ))),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please Enter Your Account Number';
                                            }
                                            return null;
                                          },
                                        ),

                                        //  Bank Account Holder
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          controller: _bankaccountholder,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                              labelText: 'Bank Account Holder',
                                              filled: true,
                                              fillColor: Colors.grey[200],
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                borderSide: const BorderSide(
                                                    color: Colors.purple),
                                              ),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 20,
                                                      horizontal: 20),
                                              prefixIcon: Padding(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: Image.asset(
                                                    'assets/icon/private-account.png', // Your icon image path
                                                    height: 20,
                                                    width: 20,
                                                  ))),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please Enter the Holder Of an Acoount';
                                            }
                                            return null;
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ]
                                // for mobile netwoks
                                else if (_selectedpayment ==
                                    'Mobile Netwoks') ...[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50, vertical: 5),
                                    child: Column(
                                      children: [
                                        DropdownButtonFormField(
                                          value: _mobilelist,
                                          hint:
                                              const Text('Select your Network'),
                                          items: <String>[
                                            'Tigopesa',
                                            'Halopesa',
                                            'M-pesa',
                                            'Airtel Money'
                                          ].map((String value) {
                                            return DropdownMenuItem(
                                                value: value,
                                                child: Text(value));
                                          }).toList(),
                                          onChanged: (String? value) {
                                            setState(() {
                                              value = _mobilelist;
                                            });
                                          },
                                          decoration: InputDecoration(
                                              labelText: 'Netwok List',
                                              filled: true,
                                              fillColor: Colors.grey[200],
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                borderSide: const BorderSide(
                                                    color: Colors.purple),
                                              ),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 20,
                                                      horizontal: 20),
                                              prefixIcon: const Padding(
                                                  padding: EdgeInsets.all(12.0),
                                                  child: Icon(
                                                      Icons.network_cell))),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please Enter Your Network';
                                            }
                                            return null;
                                          },
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),

                                        //mobilenumber
                                        TextFormField(
                                          controller: _mobilenumber,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              labelText: 'Simcard Number',
                                              filled: true,
                                              fillColor: Colors.grey[200],
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                borderSide: const BorderSide(
                                                    color: Colors.purple),
                                              ),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 20,
                                                      horizontal: 20),
                                              prefixIcon: Padding(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: Image.asset(
                                                    'assets/icon/sim-card.png', // Your icon image path
                                                    height: 20,
                                                    width: 20,
                                                  ))),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please Enter Your number';
                                            }
                                            return null;
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],

                                // TextFormField(
                                //   controller: _password,
                                //   obscureText: true,
                                //   decoration: InputDecoration(
                                //       labelText: 'Password',
                                //       filled: true,
                                //       fillColor: Colors.grey[200],
                                //       border: OutlineInputBorder(
                                //         borderRadius: BorderRadius.circular(30),
                                //         borderSide: const BorderSide(
                                //             color: Colors.purple),
                                //       ),
                                //       contentPadding:
                                //           const EdgeInsets.symmetric(
                                //               vertical: 20, horizontal: 20),
                                //       suffixIcon:
                                //           const Icon(Icons.visibility_off),
                                //       prefixIcon: Padding(
                                //           padding: const EdgeInsets.all(12.0),
                                //           child: Image.asset(
                                //             'assets/icon/3d-unlocked.png', // Your icon image path
                                //             height: 20,
                                //             width: 20,
                                //           ))),
                                //   validator: (value) {
                                //     if (value == null || value.isEmpty) {
                                //       return 'Please Enter Your Password';
                                //     }
                                //     if (value.length < 8) {
                                //       return 'The Password Must Contains atleast 8 characters';
                                //     }
                                //     return null;
                                //   },
                                // ),
                                // const SizedBox(height: 15),
                                // TextFormField(
                                //   controller: _comfirmpassword,
                                //   obscureText: true,
                                //   decoration: InputDecoration(
                                //       labelText: 'Confirm Password',
                                //       filled: true,
                                //       fillColor: Colors.grey[200],
                                //       border: OutlineInputBorder(
                                //         borderRadius: BorderRadius.circular(30),
                                //         borderSide: const BorderSide(
                                //             color: Colors.purple),
                                //       ),
                                //       contentPadding:
                                //           const EdgeInsets.symmetric(
                                //               vertical: 20, horizontal: 20),
                                //       suffixIcon:
                                //           const Icon(Icons.visibility_off),
                                //       prefixIcon: Padding(
                                //           padding: const EdgeInsets.all(12.0),
                                //           child: Image.asset(
                                //             'assets/icon/3d-unlocked.png', // Your icon image path
                                //             height: 20,
                                //             width: 20,
                                //           ))),
                                //   validator: (value) {
                                //     if (value == null || value.isEmpty) {
                                //       return 'Please Comfirm Your Password';
                                //     }
                                //     if (value != _password.text) {
                                //       return "Passwords Doesn't Match";
                                //     }
                                //     return null;
                                //   },
                                // ),

                                const SizedBox(height: 30),
                                Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      _submitForm();
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
