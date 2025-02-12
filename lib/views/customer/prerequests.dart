
import 'package:flutter/material.dart';
import 'package:logisync_mobile/controllers/customer/jobrequestprovider.dart';
import 'package:logisync_mobile/controllers/customerController.dart';
import 'package:logisync_mobile/model/customer/request.dart';
import 'package:logisync_mobile/views/customer/current.dart';
import 'package:provider/provider.dart';

class PreRequest extends StatelessWidget {
  const PreRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(title: 
               const TabBar(
            tabs: [
              Tab(text: 'Current'), // First tab
              Tab(text: 'Recent'),  // Second tab
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Current(), // Using the Current widget here
            const Icon(Icons.directions_transit), // Example widget for the second tab
          ],
        ), 
      ),
    );
  }
}

class NoScrollbarBehavior extends ScrollBehavior {
  @override
  Widget buildScrollbar(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child; // Return the child without a scrollbar
  }
}
  

class CollapsibleForm extends StatefulWidget {
  CollapsibleForm({super.key});


  
  @override
  // ignore: library_private_types_in_public_api
  _CollapsibleFormState createState() => _CollapsibleFormState();
}

class _CollapsibleFormState extends State<CollapsibleForm> {
  List<bool> isExpandedList = List.filled(3, false); // Assuming there are 3 sections
    
final GlobalKey<FormState>  _requestFormKey= GlobalKey<FormState>();
  final TextEditingController _dropLocation = TextEditingController();
  final TextEditingController _pickupLocation = TextEditingController();
  final TextEditingController _referenceNumber= TextEditingController();
  final TextEditingController _cargoDescription = TextEditingController();
  
  final String  _requestType= 'TRUCK WITH DRIVER';
  


int selectedcar = -1;
// list of cartypes
   @override
  Widget build(BuildContext context) {
         return 
          Consumer<CustomerController>(builder: (context, customerController, child) {
            return
          Scaffold(
     appBar: AppBar(title: const Text('Request Details')),
      body:
       ScrollConfiguration(
        behavior: NoScrollbarBehavior(),
        child: SingleChildScrollView(
          child:          
               Form(  
                key: _requestFormKey,          
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,vertical: 10
              ),
              child: Column(
                children: [
                  
                  // List of expandable items with unique content for each section
                  ...List.generate(3, (index) {
                    return Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isExpandedList[index] = !isExpandedList[index];
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromARGB(255, 235, 207, 240),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _getTitleForIndex(index),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Icon(
                                  isExpandedList[index] ? Icons.expand_less : Icons.expand_more,
                                  color: Colors.purple,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: isExpandedList[index] ? null : 0,
                          child: isExpandedList[index] ? _getContentForIndex(index) : Container(),
                        ),
                      ],
                    );
                  }),
              
                  // Additional button or actions below the expandable sections
                  const SizedBox(height: 20),
                   Center (
                                 child:  Row(
                                        children: [
                                           ElevatedButton(
                                   onPressed: () async {
                                      _cargoDescription.clear();
                                      _dropLocation.clear();
                                      _pickupLocation.clear();
                                      _referenceNumber.clear();

                                      Navigator.of(context).pop();
                                   },
                                   style: ElevatedButton.styleFrom(
                                     padding: const EdgeInsets.symmetric(
                                         horizontal: 35, vertical:15, ),
                                     shape: RoundedRectangleBorder(
                                       borderRadius: BorderRadius.circular(16),
                                     ),
                                     backgroundColor: Colors.purple,
                                   ),
                                   child: const Text(
                                     "Cancel",
                                     style: TextStyle(
                                       fontSize: 17,
                                       color:Color.fromARGB(210, 247, 246, 240) ),
                                   ),
                                 ),
                                       const Spacer(),
                                        ElevatedButton(
                                   onPressed: () async {
                                    if (_requestFormKey.currentState!.validate()) {
                                      
                                   
                                    //get data from data provider
                                    final jobRequest = JobRequest(                                       
                                      pickupLocation: _pickupLocation.text,
                                      deliveryLocation: _dropLocation.text,
                                      cargoDescription: _cargoDescription.text, 
                                      truckType:customerController.selectedTruckTypeId,
                                      customerID: customerController.customerID,
                                      requestType : _requestType,
                                      containerNumber: _referenceNumber.text,
                                          );

                            String result= await   Provider.of<JobRequestProvider>(context, listen:false).submitJobRequest(jobRequest);

                                 if (result == "Request sent successfully!") {
                                    showDialog(
                                      context:context, 
                                      builder: (abs)=> AlertDialog(
                                        title: const Text("Request Results"),
                                        content: Text(result),
                                        actions: [
                                          TextButton(
                                      onPressed: () => Navigator.of(abs).pop(),
                                      child: const Text("OK"))
                                        ],
                                      )
                                      );
                                      _cargoDescription.clear();
                                      _dropLocation.clear();
                                 }
                                 else{
                                  showDialog(
                                      context: context, 
                                      builder: (abs)=> AlertDialog(
                                        title: const Text("Request Results"),
                                        content: Text(result),
                                        actions: [
                                          TextButton(
                                      onPressed: () => Navigator.of(abs).pop(),
                                      child: const Text("OK"))
                                        ],
                                      )
                                      );
                                 }     _pickupLocation.clear();
                                      _referenceNumber.clear();
                                  
                                    }    
                                 },
                                 
                                              
                                   
                                   style: ElevatedButton.styleFrom(
                                     padding: const EdgeInsets.symmetric(
                                         horizontal: 35, vertical: 15),
                                     shape: RoundedRectangleBorder(
                                       borderRadius: BorderRadius.circular(16),
                                     ),
                                     backgroundColor: Colors.purple,
                                   ),
                                   child: const Text(
                                     " Request",
                                    
                                     style: TextStyle(
                                       fontSize: 16,
                                       color:Color.fromARGB(210, 247, 246, 240) ),
                                   ),
                                 ),
                                       ]
                               ),
                          )
                     
                ],
              ),
            ),
               )
            ),
      ),
    );

      });
     }

  // Function to provide specific titles based on the index
  String _getTitleForIndex(int index) {
    switch (index) {
      case 0:
        return 'Location Detail';
      case 1:
        return 'Cargo Details';
      case 2:
        return 'Means Of Transport';
      default:
        return 'Details';
    }
  }

  // Function to provide specific content based on the index
  Widget _getContentForIndex(int index) {
    switch (index) {
      case 0:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: TextFormField(
                controller: _pickupLocation,
                decoration: InputDecoration(
                  labelText: 'Pickup Location',
                  hintText: 'Please enter pickup point',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.purple),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return"please Enter your Pickup Location ";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: TextFormField(
                controller: _dropLocation,
                decoration: InputDecoration(
                  labelText: 'Drop Location',
                  hintText: 'Please enter drop point',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.purple),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return"please Enter your Dropdowm Location ";
                  }
                  return null;
                },
                
              ),
            ),
          ],
        );

      case 1:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: TextFormField(
              controller: _referenceNumber,
                decoration: InputDecoration(
                  labelText: 'Reference Number',
                  hintText: 'Enter Reference Number of a cargo',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.purple),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return"please Enter your Reference Number";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: TextFormField(
                controller: _cargoDescription,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Cargo description',
                  hintText: 'Please Describe your Cargo',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.purple),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return"please Enter your cargo description ";
                  }
                  return null;
                },
              ),
            ),
          ],
        );

      case 2:
        // ignore: avoid_unnecessary_containers
        return Consumer<CustomerController>(
          builder:(context, customerController, child){
             if (customerController.availableTruckTypes.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            return
 Column(
   children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
              child: DropdownButtonFormField(
                                            value: _requestType,
                                             items: <String>[
                                              'TRUCK WITH DRIVER',
                                              'DRIVER ONLY',
                                              'TRUCK ONLY',
                                              
                                            ].map((String value) {
                                              return DropdownMenuItem(
                                                  value: value,
                                                  child: Text(value));
                                            }).toList(),
                                            onChanged: (String? value) {
                                              setState(() {
                                                value = _requestType;
                                              });
                                            },
                                            decoration: InputDecoration(
                                                labelText: 'Request Type',
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
                                               ),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please Enter Your request type';
                                              }
                                              return null;
                                            },
                                          ),
            ),
                                        
         const SizedBox(height: 9,),
     Column(
       children: [
          const Text(
            'Select Truck Type',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 4),
            child:  SizedBox(
             height: 200,
              child: GridView.builder(
               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
                 mainAxisSpacing: 7,
                 crossAxisSpacing: 7,
                 childAspectRatio: 1.0),
              itemCount: customerController.availableTruckTypes.length,
              itemBuilder:(context,index) {
                final availableTruckTypeData= customerController.availableTruckTypes[index];
                 return ElevatedButton(
                   onPressed:(){
                     setState(() {
                       customerController.setSelectedTruckTypeData(availableTruckTypeData.truckTypeID, availableTruckTypeData.typeName);
                      
                     });
                   },
                   style: ElevatedButton.styleFrom(
                      backgroundColor: customerController.selectedTruckTypeId==availableTruckTypeData.truckTypeID ? Colors.purple :Colors.white,
                      foregroundColor:customerController.selectedTruckTypeId==availableTruckTypeData.truckTypeID ? Colors.white : Colors.purple,
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(30)
                     )
                   ),
                    child:Column(
                      
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              Image.asset(
                               customerController.availableTruckTypes[index].sampleImageUrl,
                               height: 90,
                               width: 90,
                              ),
                              Text(
                              customerController.availableTruckTypes[index].typeName,
                               style: const TextStyle(
                                 fontSize: 15,
                                 fontWeight: FontWeight.bold
                               ),
                              )
                                  ],
                    )
                   );
              }),
            ),
             ),
       ],
     ),
   ],
 );


        }
        );
        
       
      default:
        return Container();
    }
  }
}




