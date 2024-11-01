//  ScrollConfiguration(
//       behavior:NoScrollbarBehavior(),
//       child:SingleChildScrollView(
          
//         child: Expanded(
          
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const SizedBox(height: 30), // Space before the form
                        
//                   // Form Container
//                   Container(
//                     width: 400,
                    
//                     margin: const EdgeInsets.symmetric(horizontal: 20),
//                     padding: const EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12),
//                       boxShadow: const [
//                         BoxShadow(
//                           color: Color.fromARGB(135, 74, 69, 75),
//                           blurRadius: 10,
//                           offset: Offset(10, 5),
//                         ),
//                       ],
//                     ),
//                     child: Form(
//                       key: requestFormKey,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             "Request",
//                             style: TextStyle(
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.purple,
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                           TextFormField(
//                             decoration: InputDecoration(
//                               labelText: 'Pick up Location',
//                               filled: true,
//                               fillColor: Colors.grey[200],
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                                 borderSide: BorderSide.none,
//                               ),
//                               contentPadding: const EdgeInsets.symmetric(
//                                   vertical: 20, horizontal: 20),
//                             ),
//                           ),
//                           const SizedBox(height: 15),
//                           TextFormField(
//                             keyboardType: TextInputType.text,
//                             decoration: InputDecoration(
//                               labelText: 'Delivary Location',
//                               filled: true,
//                               fillColor: Colors.grey[200],
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                                 borderSide: BorderSide.none,
//                               ),
//                               contentPadding: const EdgeInsets.symmetric(
//                                   vertical: 20, horizontal: 20),
//                             ),
//                           ),
//                            const SizedBox(height: 15),
//                            TextFormField(
//                             keyboardType: TextInputType.number,
//                             decoration: InputDecoration(
//                               labelText: 'Container Number',
//                               filled: true,
//                               fillColor: Colors.grey[200],
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                                 borderSide: BorderSide.none,
//                               ),
//                               contentPadding: const EdgeInsets.symmetric(
//                                   vertical: 20, horizontal: 20),
//                             ),
//                           ),
                          
//                           const SizedBox(height: 15),
//                           TextFormField(
//                             keyboardType: TextInputType.text,
//                             maxLines: 4,
//                             decoration: InputDecoration(
//                               labelText: 'Cargo Description',
//                               filled: true,
//                               fillColor: Colors.grey[200],
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                                 borderSide: BorderSide.none,
//                               ),
//                               contentPadding: const EdgeInsets.symmetric(
//                                   vertical: 20, horizontal: 20),
//                             ),
//                           ),
//                          const SizedBox(height: 15),
//                            TextFormField(
//                             keyboardType: TextInputType.text,
//                             decoration: InputDecoration(
//                               labelText: 'Select Truck',
//                               filled: true,
//                               fillColor: Colors.grey[200],
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                                 borderSide: BorderSide.none,
//                               ),
//                               contentPadding: const EdgeInsets.symmetric(
//                                   vertical: 20, horizontal: 20),
//                             ),
//                           ),
//                           //  const SizedBox(height: 15),
//                           // DropdownButtonFormField<String>(
//                           //     decoration: InputDecoration(
//                           //     labelText: 'Request Type',
//                           //     filled: true,
//                           //     fillColor: Colors.grey[200],
//                           //     border: OutlineInputBorder(
//                           //       borderRadius: BorderRadius.circular(30),
//                           //       borderSide: BorderSide.none,
//                           //     ),
//                           //     contentPadding: const EdgeInsets.symmetric(
//                           //         vertical: 20, horizontal: 20),
//                           //   ),
//                           //   // value:'',
//                           //   // items:requestType.map<DropdownButtonFormField<String>>(String value) {
//                           //   //   return <DropdownButtonFormField<String>(
//                           //   //     value= value,
//                           //   //     chald:Text(value);
//                           //   // }

                            
//                          // ),
                           
//                           const SizedBox(height: 15),
//                            TextFormField(
//                             keyboardType: TextInputType.text,
//                             decoration: InputDecoration(
//                               labelText: 'Price Requied',
//                               filled: true,
//                               fillColor: Colors.grey[200],
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                                 borderSide: BorderSide.none,
//                               ),
//                               contentPadding: const EdgeInsets.symmetric(
//                                   vertical: 20, horizontal: 20),
//                             ),
//                           ),
                         
//                           const SizedBox(height: 40),
                         
//                           Center (
//                             child:  Row(
//                                    children: [
//                                       ElevatedButton(
//                               onPressed: () {},
//                               style: ElevatedButton.styleFrom(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 35, vertical:15, ),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(16),
//                                 ),
//                                 backgroundColor: Colors.purple,
//                               ),
//                               child: const Text(
//                                 "Cancel",
                                
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   color:Color.fromARGB(210, 247, 246, 240) ),
//                               ),
//                             ),
//                                   const Spacer(),
//                                    ElevatedButton(
//                               onPressed: () {},
//                               style: ElevatedButton.styleFrom(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 35, vertical: 15),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(16),
//                                 ),
//                                 backgroundColor: Colors.purple,
//                               ),
//                               child: const Text(
//                                 " Request",
                                
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   color:Color.fromARGB(210, 247, 246, 240) ),
//                               ),
//                             ),
//                                   ]
//                           ),
              
              
                            
                           
//                           ),  
//                         ]   
//                       ),
//                     ),
                
//                   ),
                
//                 ]
//                         ),
//             ),
//         ),
//       )
    
     
    
//     )   
//     )