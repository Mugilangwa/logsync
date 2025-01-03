



import 'package:flutter/material.dart';

class NegotiationPage extends StatefulWidget {
  const NegotiationPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NegotiationPageState createState() => _NegotiationPageState();
}

class _NegotiationPageState extends State<NegotiationPage> {
  final  _negotiationFormkey = GlobalKey<FormState>();
  bool _showInputField = false;
  
  bool isvisible = false;
  
  String _lastAcceptedAmount = "100.0";
  final String _lastcampAmount = "1000.0";
  String _lastAdvanceAmount = "100";
  final List<Map<String,String>> _conversationHistory = [];

  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _advanceController = TextEditingController();

  void _toggleNegotiationField() {
    setState(() {
      _showInputField = !_showInputField;
    });
  }

  // ignore: unused_element
  void  _receiveOrganizationPrice(){
    setState(() {     
      _conversationHistory.add({
        "price":_lastcampAmount ,
        "discount":_lastAdvanceAmount,
        "sender": "organization"
    }
      );
    });
  }


  void _sendNegotiation() {
    if (_priceController.text.isNotEmpty && _advanceController.text.isNotEmpty) {
      setState(() {
        _lastAcceptedAmount = _priceController.text;
        _lastAdvanceAmount = _advanceController.text ;

        
        // double discount= ((_lastAcceptedAmount - _lastAdvanceAmount)/_lastAcceptedAmount)*100;
        
        _conversationHistory.add({
          "price": _lastAcceptedAmount,
          "discount":_lastAdvanceAmount,
          "sender": "Customer"
        });
        _receiveOrganizationPrice();
        _showInputField = false;
        _priceController.clear();
        _advanceController.clear();
      });
    }
  }

  void _showHistory() {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.8,
        maxChildSize: 1,
        minChildSize: 0.6,
        builder: (context, scrollController) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: const Text('Negotiation History'),
                  trailing: const Icon(Icons.close),
                  onTap: () => Navigator.pop(context),
                  
                ),
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: _conversationHistory.length,
                    itemBuilder: (context, index) {
                      final entry = _conversationHistory[index];
                      bool isCustomer = entry["sender"] == "Customer";
                      return
                       Align(
                         alignment: isCustomer ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: isCustomer ? Colors.blue[100] : Colors.green[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${entry["discount"]}% Discount",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "\$${entry["price"]}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                entry["sender"]!,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(" Price Negotiation "),
      backgroundColor: const Color.fromARGB(255, 245, 222, 222),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60.0),
        child: Column(
          children: [
            Center(
              child: 
               SizedBox(width: 400,height: 50,
                 child: ElevatedButton(
                  
                  onPressed: _showHistory,
                  style:ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.purple,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12)
                    )
                  )
                               )
                 
                               ,
                               child: const Text("History",
                               style: TextStyle(
                                fontWeight: FontWeight.bold
                               ),),
                             ),
               ),
            ),
            const SizedBox(height: 9,),
             Row(
              mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Container(
                   padding: const EdgeInsets.all(9),
                       decoration: const BoxDecoration(
                          color: Color.fromARGB(255,232,201, 238),
                         borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12))),
                            child: Text(_lastcampAmount ),
                        ),
               ],
             ),
                 const SizedBox(height: 8,),                                  
             Row(
              mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 Container(
                  padding: const EdgeInsets.all(9),
                  decoration: const BoxDecoration(
                          color: Color.fromARGB(255,232,201, 238),
                         borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(12),
                             bottomLeft: Radius.circular(12),
                             topLeft:Radius.circular(12) )),
                  child: Text(_lastAcceptedAmount),),
               ],
             ),
            const SizedBox(height: 15,),
              if (_showInputField)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0),
                child: Form(
                  key: _negotiationFormkey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _priceController,
                        decoration: const InputDecoration(labelText: "Enter your price"),
                        keyboardType: TextInputType.number,
                        validator:(value){
                               if (value==null || value.isEmpty) {
                                 return "This field cant be empty..";
                               }
                               return null;
                        },
                      ),
                    const  SizedBox(height: 8,),
                      TextFormField(
                        controller: _advanceController,
                        decoration:const InputDecoration(labelText: "Enter advance (amount/percentage)"),
                        validator:(value){
                               if (value==null || value.isEmpty) {
                                 return "Please enter the Advance";
                               }
                               return null;
                        },
                      ),
                      const   SizedBox(height:12,),
                      ElevatedButton(
                        onPressed: (){
                          if (_negotiationFormkey.currentState!.validate()) {
                            _sendNegotiation();
                          }
                        }
                        ,
                        child:const Text("Send Request"),
                      ),
                    ],
                  ),
                ),
              ),
             const  SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
              onPressed: _toggleNegotiationField,
              child: Text(isvisible? 'Cancel':'Negotiate'),
            ),
          ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                 isScrollControlled: true,
                 backgroundColor: Colors.transparent,

                   builder:(context)=> 
                DraggableScrollableSheet(
                  initialChildSize: 0.8,
                  maxChildSize: 1,
                  minChildSize: 0.6,
                    builder:(context,scrollController , ){
                        bool ischecked = false;
                         bool isagree = false;
                    return  StatefulBuilder(
                      builder:(BuildContext content , StateSetter  setModalState){
                          return    Container(
                               decoration:
                                                                        const BoxDecoration(
                                                                            color: Colors
                                                                                .white,
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              topLeft:
                                                                                  Radius.circular(10),
                                                                              topRight:
                                                                                  Radius.circular(10),
                                                                            )),
                                                                    child:
                                                                        ListView(
                                                                      controller:
                                                                          scrollController,
                                                                      children: [
                                                                        ListTile(
                                                                          title: const Text(
                                                                              'Payment Agreements'),
                                                                          trailing:
                                                                              const Icon(
                                                                            Icons
                                                                                .close,
                                                                          ),
                                                                          onTap: () =>
                                                                              (Navigator.pop(context)),
                                                                         
                                                                        ),
                                                                        Center(
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsets
                                                                                .all(
                                                                                30),
                                                                            child:
                                                                                Container(
                                                                              decoration:
                                                                                  BoxDecoration(color: const Color.fromARGB(239, 233, 218, 238), borderRadius: BorderRadius.circular(25)),
                                                                              child:
                                                                                  Padding(
                                                                                padding: const EdgeInsets.all(20),
                                                                                child: Column(
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    Column(
                                                                                        children: [
                                  
                                                                                      const Text('First Installments ',
                                                                                      style: TextStyle(
                                                                                        color: Colors.black,
                                                                                        fontSize: 15,
                                                                                      ),),
                                                                                          Form(
                                                                                           
                                                                                              child: Column(
                                                                                            children: [
                                                                                              TextFormField(
                                                                                                keyboardType: TextInputType.number,
                                                                                                decoration: const InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)))),
                                                                                              ),
                                                                                              const SizedBox(
                                                                                                height: 30,
                                                                                              ),
                                                                                              ElevatedButton(
                                                                                                
                                                                                                  onPressed: () {
                                                                                                    setModalState(() {
                                                                                                      ischecked = !ischecked;
                                                                                                    });
                                                                                                  },
                                                                                                  style: ElevatedButton.styleFrom(
                                                                                                    backgroundColor: Colors.purple,
                                                                                                    shape: RoundedRectangleBorder(
                                                                                                      borderRadius: BorderRadius.circular(15),
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: const Text(
                                                                                                    'Send',
                                                                                                    style: TextStyle(
                                                                                                      color: Colors.white,
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                      fontSize: 20,
                                                                                                    ),
                                                                                                  ))
                                                                                            ],
                                                                                          )),
                                                                                        ],
                                                                                      ),
                                  
                                                                                      const SizedBox(height: 20,),
                                                                                    if (ischecked)
                                                                                    
                                                                                      Column(
                                                                                        children: [
                                                                                               const Text('CAMPANY CO LTD' ,style: TextStyle(color: Colors.black,fontSize: 20),),
                                                                                           const Text(
                                                                                      'Request Descriptions:\n\n'
                                                                                      ' Hellow , Daniel Hussein\n'
                                                                                      'Thanks for having faithfull on us we highly exited to Deliver Your \n'
                                                                                      'Requestnumber: T121JJHKJKJG\n'
                                                                                      'FROM  DAR-ES-SALAAM \n'
                                                                                      'TO : CONGO\n'
                                                                                      'DATE: 12 january,2024\n'
                                                                                      'PAYMENT STATUS: PARTIAL\n'
                                                                                      'AMOUNT: 23,000,000\n'
                                                                                      ,
                                                                                      style: TextStyle(fontSize: 14, color: Colors.black38),
                                                                                    ),
                                                                                           const Text(
                                                                                      'Terms and Conditions Summary:\n\n'
                                                                                      '1. You agree to pay for the delivery services based on cargo size and destination.\n'
                                                                                      '2. Payment must be made in full before the service is provided.\n'
                                                                                      '3. Payments are due at the time of booking.\n'
                                                                                      '4. Cancellations may be refunded if made before delivery; otherwise, costs are non-refundable.\n'
                                                                                      '5. Late payments will incur additional fees.\n'
                                                                                      '6. The Company is not liable for damage or loss after payment is processed and delivery is complete.\n'
                                                                                      '7. Disputes must be raised within [specified time] days.\n'
                                                                                      '8. The Company reserves the right to update these Terms.',
                                                                                      style: TextStyle(fontSize: 14, color: Colors.black54),
                                                                                    ),
                                                                                    const SizedBox(
                                                                                      height: 10,
                                                                                    ),
                                                                                    Row(
                                                                                      children: [
                                                                                        Checkbox(
                                                                                            value: isagree,
                                                                                            onChanged: (bool? value) {
                                                                                              setModalState(() {
                                                                                                isagree = value ?? false;
                                                                                              });
                                                                                            }),
                                                                                        const Text('I Agree')
                                                                                      ],
                                                                                    ),
                                                                                    if (isagree)
                                                                                       Column(
                                                                                            children: [
                                                                                              
                                                                                              const SizedBox(
                                                                                                height: 30,
                                                                                              ),
                                                                                              ElevatedButton(
                                                                                                  onPressed: () {},
                                                                                                  style: ElevatedButton.styleFrom(
                                                                                                    backgroundColor: Colors.purple,
                                                                                                    shape: RoundedRectangleBorder(
                                                                                                      borderRadius: BorderRadius.circular(15),
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: const Text(
                                                                                                    'Continue',
                                                                                                    style: TextStyle(
                                                                                                      color: Colors.white,
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                      fontSize: 20,
                                                                                                    ),
                                                                                                  ))
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  );
                                                               
                    
                      }
                      
                      );
                    
                    
                    
                    
                    
                      
                    }
                   )
                 );

                   
                   },
                   
              

              child: const Text("Confirm"),
          ),
                
           
      
                ]
              )
          ]
            
      )
        ),
    );
    
  }
}
