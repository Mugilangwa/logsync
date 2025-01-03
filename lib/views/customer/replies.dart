import 'package:flutter/material.dart';
import 'package:logisync_mobile/views/customer/negotiation.dart';

// ignore: must_be_immutable

// ignore: must_be_immutable
class Replies extends StatefulWidget {
  final requestFormKey = GlobalKey<FormState>();
  Replies({super.key});

  @override
// ignore: library_private_types_in_public_api
  _RepliesState createState() => _RepliesState();
}

class _RepliesState extends State<Replies> {
  bool ischecked = false;
  bool isvisible = false;
  bool isagree = false;
 
  late final String? customerprice;
  final double campanyprice = 50000;
  final TextEditingController _priceControler = TextEditingController();

  void negotiate(){
    setState(() {
      isvisible =  !isvisible; 
    });
  }












  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Number of Replies')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ScrollConfiguration(
          behavior: NoScrollbarBehavior(),
          child: SingleChildScrollView(
              child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                       style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius:  BorderRadius.circular(5)
                        )
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Text('Campany Name'),
                          ),
                          Column(
                            children: [
                              
                              Text( 'Tsh 45000 '
                              ),
                            ],
                          )
                        ],
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext content) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: StatefulBuilder(
                                  builder: (context, setDialogState){
                                    return Container(
                                    padding: const EdgeInsets.all(20),
                                    width: double.infinity,
                                    child: Column(
                                      children: [
                                        Center(
                                          child: Container(
                                              decoration: const BoxDecoration(
                                                color: Color.fromARGB(255, 183, 83, 201),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(9),
                                                  topRight: Radius.circular(9),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Center(
                                                    child: Text(
                                                      'Price Negotiation',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.amber),
                                                    ),
                                                  ),
                                                  IconButton(
                                                      onPressed: () {
                                                        Navigator.of(content)
                                                            .pop();
                                                      },
                                                      icon: const Icon(
                                                        Icons.cancel,
                                                        color: Colors.white,
                                                      ))
                                                ],
                                              )),
                                        ),
                                        Expanded(
                                          child: Padding(
                                              padding: const EdgeInsets.all(20),
                                              child: Column(
                                                children: [
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Container(
                                                          decoration: const BoxDecoration(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      232,
                                                                      201,
                                                                      238),
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          12),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          12))),
                                                          child: const Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    6.0),
                                                            child: Text(
                                                              '230,000' ,
                                                              style: TextStyle(
                                                                fontSize: 19,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color:
                                                                    Colors.black,
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ]),
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          decoration: const BoxDecoration(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      232,
                                                                      201,
                                                                      238),
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          12),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          12))),
                                                          child: const Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    6.0),
                                                            child: Text(
                                                              '23000',
                                                              style: TextStyle(
                                                                fontSize: 19,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color:
                                                                    Colors.black,
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ]),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  
                                                  if (isvisible) 
                                                    Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Form(
                                                              child: Expanded(
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize.min,
                                                                children: [
                                                                  Expanded(
                                                                    flex: 8,
                                                                    child: TextFormField(
                                                                      controller: _priceControler,
                                                                        keyboardType:TextInputType.text,
                                                                        decoration:
                                                                            const InputDecoration(
                                                                              hintText: 'Enter Price..'
                                                                            )),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 2,
                                                                    child: IconButton(
                                                                        onPressed: () {
                                                                          String proposedprice= _priceControler.text;
                                                                          if(proposedprice.isNotEmpty){
                                                                            customerprice= proposedprice;
                                                                            ScaffoldMessenger.of(content).showSnackBar(
                                                                            SnackBar(
                                                                              content:Text("Proposed Price: \$$proposedprice")
                                                                              ) 
                                                                        );
                                                                          }
                                                                          
                                                                        },
                                                                        icon: const Icon(Icons.send)),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ))
                                                        ]),
                                                  
                                                ],
                                              )),
                                        ),
                                        if (isvisible)
                                                Column(
                                                  children: [
                                                    TextFormField(
                                                      // controller: _priceController,
                                                      decoration: const InputDecoration(labelText: "Enter your price"),
                                                      keyboardType: TextInputType.number,
                                                    ),
                                                    TextFormField(
                                                      // controller: _advanceController,
                                                      decoration: const InputDecoration(labelText: "Enter advance (amount/percentage)"),
                                                    ),
                                                    ElevatedButton(
                                                      // onPressed: _sendNegotiation,
                                                      onPressed: () {  },
                                                      child: const Text("Send Request"),
                                                    ),
                                                  ],
                                                ),
                                        const SizedBox(height: 25),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              ElevatedButton(
                                                  onPressed: negotiate,
                                                  child: Text(isvisible ?'Cancel Negotiation': 'Negotiate')),
                                              const Spacer(),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(content).pop();
                                                    showModalBottomSheet(
                                                        context: context,
                                                        isScrollControlled: true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        builder: (context) =>
                                                            DraggableScrollableSheet(
                                                                initialChildSize:
                                                                    0.8,
                                                                maxChildSize: 1,
                                                                minChildSize: 0.6,
                                                                builder: (context,
                                                                    scrollController) {
                                                                  return Container(
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
                                                                                                    setState(() {
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
                                                                                              setState(() {
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
                                                                }));
                                                  },
                                                  child: const Text('Confirm'))
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                               
                                  }
                                  ),
                              );
                            });
                      },
                    )
                  
                   ,
                   const SizedBox(height: 15,),
                   ElevatedButton(
                       style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius:  BorderRadius.circular(5)
                        )
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Text('Campany Name'),
                          ),
                          Column(
                            children: [
                              
                              Text( 'Tsh 50000 '
                              ),
                            ],
                          )
                        ],
                      ),
                      onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const NegotiationPage()),
                        );
                      //   showDialog(
                      //       context: context,
                      //       builder: (BuildContext content) {
                      //         return Dialog(
                      //           shape: RoundedRectangleBorder(
                      //               borderRadius: BorderRadius.circular(20)),
                      //           child: Container(
                      //             padding: const EdgeInsets.all(20),
                      //             width: double.infinity,
                      //             child: Column(
                      //               children: [
                      //                 Center(
                      //                   child: Container(
                      //                       decoration: const BoxDecoration(
                      //                         color: Colors.purple,
                      //                         borderRadius: BorderRadius.only(
                      //                           topLeft: Radius.circular(15),
                      //                           topRight: Radius.circular(15),
                      //                         ),
                      //                       ),
                      //                       child: Row(
                      //                         mainAxisAlignment:
                      //                             MainAxisAlignment
                      //                                 .spaceBetween,
                      //                         children: [
                      //                           const Center(
                      //                             child: Text(
                      //                               'Price Negotiation',
                      //                               style: TextStyle(
                      //                                   fontSize: 20,
                      //                                   fontWeight:
                      //                                       FontWeight.bold,
                      //                                   color: Colors.amber),
                      //                             ),
                      //                           ),
                      //                           IconButton(
                      //                               onPressed: () {
                      //                                 Navigator.of(content)
                      //                                     .pop();
                      //                               },
                      //                               icon: const Icon(
                      //                                 Icons.cancel,
                      //                                 color: Colors.white,
                      //                               ))
                      //                         ],
                      //                       )),
                      //                 ),
                      //                 Expanded(
                      //                   child: Padding(
                      //                       padding: const EdgeInsets.all(20),
                      //                       child: Column(
                      //                         children: [
                      //                           Row(
                      //                               mainAxisAlignment:
                      //                                   MainAxisAlignment.end,
                      //                               children: [
                      //                                 Container(
                      //                                   decoration: const BoxDecoration(
                      //                                       color: Color
                      //                                           .fromARGB(
                      //                                               255,
                      //                                               232,
                      //                                               201,
                      //                                               238),
                      //                                       borderRadius: BorderRadius.only(
                      //                                           topLeft: Radius
                      //                                               .circular(
                      //                                                   12),
                      //                                           bottomRight: Radius
                      //                                               .circular(
                      //                                                   12))),
                      //                                   child: const Padding(
                      //                                     padding:
                      //                                         EdgeInsets.all(
                      //                                             6.0),
                      //                                     child: Text(
                      //                                       '230,000' ,
                      //                                       style: TextStyle(
                      //                                         fontSize: 19,
                      //                                         fontWeight:
                      //                                             FontWeight
                      //                                                 .bold,
                      //                                         color:
                      //                                             Colors.black,
                      //                                       ),
                      //                                     ),
                      //                                   ),
                      //                                 )
                      //                               ]),
                      //                           Row(
                      //                               mainAxisAlignment:
                      //                                   MainAxisAlignment.start,
                      //                               children: [
                      //                                 Container(
                      //                                   decoration: const BoxDecoration(
                      //                                       color: Color
                      //                                           .fromARGB(
                      //                                               255,
                      //                                               232,
                      //                                               201,
                      //                                               238),
                      //                                       borderRadius: BorderRadius.only(
                      //                                           topLeft: Radius
                      //                                               .circular(
                      //                                                   12),
                      //                                           bottomRight: Radius
                      //                                               .circular(
                      //                                                   12))),
                      //                                   child: const Padding(
                      //                                     padding:
                      //                                         EdgeInsets.all(
                      //                                             6.0),
                      //                                     child: Text(
                      //                                       '23000',
                      //                                       style: TextStyle(
                      //                                         fontSize: 19,
                      //                                         fontWeight:
                      //                                             FontWeight
                      //                                                 .bold,
                      //                                         color:
                      //                                             Colors.black,
                      //                                       ),
                      //                                     ),
                      //                                   ),
                      //                                 )
                      //                               ]),
                      //                           const SizedBox(
                      //                             height: 10,
                      //                           ),
                      //                           if (isvisible) 
                      //                             Row(
                      //                                 mainAxisAlignment:
                      //                                     MainAxisAlignment
                      //                                         .start,
                      //                                 children: [
                      //                                   Form(
                      //                                       child: Expanded(
                      //                                     child: Center(
                      //                                       child: Row(
                      //                                         mainAxisSize:
                      //                                             MainAxisSize.min,
                      //                                         children: [
                      //                                           Expanded(
                      //                                             flex: 8,
                      //                                             child: TextFormField(
                      //                                               controller: _priceControler,
                      //                                                 keyboardType:TextInputType.text,
                      //                                                 decoration:
                      //                                                     const InputDecoration(
                      //                                                       hintText: 'Enter Price..'
                      //                                                     )),
                      //                                           ),
                      //                                           Expanded(
                      //                                             flex: 2,
                      //                                             child: IconButton(
                      //                                                 onPressed: () {
                      //                                                   String proposedprice= _priceControler.text;
                      //                                                   if(proposedprice.isNotEmpty){
                      //                                                     customerprice= proposedprice;
                      //                                                     ScaffoldMessenger.of(content).showSnackBar(
                      //                                                     SnackBar(
                      //                                                       content:Text("Proposed Price: \$$proposedprice")
                      //                                                       ) 
                      //                                                 );
                      //                                                   }
                                                                        
                      //                                                 },
                      //                                                 icon: const Icon(Icons.send)),
                      //                                           )
                      //                                         ],
                      //                                       ),
                      //                                     ),
                      //                                   ))
                      //                                 ]),
                                                
                      //                         ],
                      //                       )),
                      //                 ),
                      //                 const SizedBox(height: 25),
                      //                 Padding(
                      //                   padding: const EdgeInsets.all(8.0),
                      //                   child: Row(
                      //                     children: [
                      //                       ElevatedButton(
                      //                           onPressed: () {
                      //                             // Navigator.of(content).pop();
                      //                             setState(() {
                      //                               isvisible = !isvisible;
                      //                             });
                      //                           },
                      //                           child: Text(isvisible ?'Cancel Negotiation': 'Negotiate')),
                      //                       const Spacer(),
                      //                       ElevatedButton(
                      //                           onPressed: () {
                      //                             Navigator.of(content).pop();
                      //                             showModalBottomSheet(
                      //                                 context: context,
                      //                                 isScrollControlled: true,
                      //                                 backgroundColor:
                      //                                     Colors.transparent,
                      //                                 builder: (context) =>
                      //                                     DraggableScrollableSheet(
                      //                                         initialChildSize:
                      //                                             0.8,
                      //                                         maxChildSize: 1,
                      //                                         minChildSize: 0.6,
                      //                                         builder: (context,
                      //                                             scrollController) {
                      //                                           return Container(
                      //                                             decoration:
                      //                                                 const BoxDecoration(
                      //                                                     color: Colors
                      //                                                         .white,
                      //                                                     borderRadius:
                      //                                                         BorderRadius.only(
                      //                                                       topLeft:
                      //                                                           Radius.circular(10),
                      //                                                       topRight:
                      //                                                           Radius.circular(10),
                      //                                                     )),
                      //                                             child:
                      //                                                 ListView(
                      //                                               controller:
                      //                                                   scrollController,
                      //                                               children: [
                      //                                                 ListTile(
                      //                                                   title: const Text(
                      //                                                       'Payment Agreements'),
                      //                                                   trailing:
                      //                                                       const Icon(
                      //                                                     Icons
                      //                                                         .close,
                      //                                                   ),
                      //                                                   onTap: () =>
                      //                                                       (Navigator.pop(context)),
                                                                       
                      //                                                 ),
                      //                                                 Center(
                      //                                                   child:
                      //                                                       Padding(
                      //                                                     padding: const EdgeInsets
                      //                                                         .all(
                      //                                                         30),
                      //                                                     child:
                      //                                                         Container(
                      //                                                       decoration:
                      //                                                           BoxDecoration(color: const Color.fromARGB(239, 233, 218, 238), borderRadius: BorderRadius.circular(25)),
                      //                                                       child:
                      //                                                           Padding(
                      //                                                         padding: const EdgeInsets.all(20),
                      //                                                         child: Column(
                      //                                                           mainAxisAlignment: MainAxisAlignment.start,
                      //                                                           children: [
                      //                                                             Column(
                      //                                                                 children: [

                      //                                                               const Text('First Installments ',
                      //                                                               style: TextStyle(
                      //                                                                 color: Colors.black,
                      //                                                                 fontSize: 20,
                      //                                                               ),),
                      //                                                               const Text('The price it should be 30% of Agreed Price',
                      //                                                               style: TextStyle(
                      //                                                                 color: Colors.black,
                      //                                                                 fontSize: 20,
                      //                                                               ),),
                      //                                                                   Form(
                                                                                         
                      //                                                                       child: Column(
                      //                                                                     children: [
                      //                                                                       TextFormField(
                      //                                                                         keyboardType: TextInputType.number,
                      //                                                                         decoration: const InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)))),
                      //                                                                       ),
                      //                                                                       const SizedBox(
                      //                                                                         height: 30,
                      //                                                                       ),
                      //                                                                       ElevatedButton(
                                                                                              
                      //                                                                           onPressed: () {
                      //                                                                             setState(() {
                      //                                                                               ischecked = !ischecked;
                      //                                                                             });
                      //                                                                           },
                      //                                                                           style: ElevatedButton.styleFrom(
                      //                                                                             backgroundColor: Colors.purple,
                      //                                                                             shape: RoundedRectangleBorder(
                      //                                                                               borderRadius: BorderRadius.circular(15),
                      //                                                                             ),
                      //                                                                           ),
                      //                                                                           child: const Text(
                      //                                                                             'Send',
                      //                                                                             style: TextStyle(
                      //                                                                               color: Colors.white,
                      //                                                                               fontWeight: FontWeight.bold,
                      //                                                                               fontSize: 20,
                      //                                                                             ),
                      //                                                                           ))
                      //                                                                     ],
                      //                                                                   )),
                      //                                                                 ],
                      //                                                               ),

                      //                                                               const SizedBox(height: 20,),
                      //                                                             if (ischecked)
                                                                                  
                      //                                                               Column(
                      //                                                                 children: [
                      //                                                                        const Text('CAMPANY CO LTD' ,style: TextStyle(color: Colors.black,fontSize: 20),),
                      //                                                                    const Text(
                      //                                                               'Request Descriptions:\n\n'
                      //                                                               ' Hellow , Daniel Hussein\n'
                      //                                                               'Thanks for having faithfull on us we highly exited to Deliver Your \n'
                      //                                                               'Requestnumber: T121JJHKJKJG\n'
                      //                                                               'FROM  DAR-ES-SALAAM \n'
                      //                                                               'TO : CONGO\n'
                      //                                                               'DATE: 12 january,2024\n'
                      //                                                               'PAYMENT STATUS: PARTIAL\n'
                      //                                                               'AMOUNT: 23,000,000\n'
                      //                                                               ,
                      //                                                               style: TextStyle(fontSize: 14, color: Colors.black38),
                      //                                                             ),
                      //                                                                    const Text(
                      //                                                               'Terms and Conditions Summary:\n\n'
                      //                                                               '1. You agree to pay for the delivery services based on cargo size and destination.\n'
                      //                                                               '2. Payment must be made in full before the service is provided.\n'
                      //                                                               '3. Payments are due at the time of booking.\n'
                      //                                                               '4. Cancellations may be refunded if made before delivery; otherwise, costs are non-refundable.\n'
                      //                                                               '5. Late payments will incur additional fees.\n'
                      //                                                               '6. The Company is not liable for damage or loss after payment is processed and delivery is complete.\n'
                      //                                                               '7. Disputes must be raised within [specified time] days.\n'
                      //                                                               '8. The Company reserves the right to update these Terms.',
                      //                                                               style: TextStyle(fontSize: 14, color: Colors.black54),
                      //                                                             ),
                      //                                                             const SizedBox(
                      //                                                               height: 10,
                      //                                                             ),
                      //                                                             Row(
                      //                                                               children: [
                      //                                                                 Checkbox(
                      //                                                                     value: isagree,
                      //                                                                     onChanged: (bool? value) {
                      //                                                                       setState(() {
                      //                                                                         isagree = value ?? false;
                      //                                                                       });
                      //                                                                     }),
                      //                                                                 const Text('I Agree')
                      //                                                               ],
                      //                                                             ),
                      //                                                             if (isagree)
                      //                                                                Column(
                      //                                                                     children: [
                                                                                            
                      //                                                                       const SizedBox(
                      //                                                                         height: 30,
                      //                                                                       ),
                      //                                                                       ElevatedButton(
                      //                                                                           onPressed: () {},
                      //                                                                           style: ElevatedButton.styleFrom(
                      //                                                                             backgroundColor: Colors.purple,
                      //                                                                             shape: RoundedRectangleBorder(
                      //                                                                               borderRadius: BorderRadius.circular(15),
                      //                                                                             ),
                      //                                                                           ),
                      //                                                                           child: const Text(
                      //                                                                             'Continue',
                      //                                                                             style: TextStyle(
                      //                                                                               color: Colors.white,
                      //                                                                               fontWeight: FontWeight.bold,
                      //                                                                               fontSize: 20,
                      //                                                                             ),
                      //                                                                           ))
                      //                                                                     ],
                      //                                                                   ),
                      //                                                                 ],
                      //                                                               ),
                      //                                                           ],
                      //                                                         ),
                      //                                                       ),
                      //                                                     ),
                      //                                                   ),
                      //                                                 )
                      //                                               ],
                      //                                             ),
                      //                                           );
                      //                                         }));
                      //                           },
                      //                           child: const Text('Confirm'))
                      //                     ],
                      //                   ),
                      //                 )
                      //               ],
                      //             ),
                      //           ),
                      //         );
                      //       });
                      // 
                      },
                    )
                 ],
                ),
              ),
            ),
          )),
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
