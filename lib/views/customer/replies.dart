

import 'package:flutter/material.dart';
import 'package:logisync_mobile/controllers/customerController.dart';

import 'package:logisync_mobile/model/customer/jobRequest.dart';
import 'package:provider/provider.dart';

import '../../model/customer/request.dart';

// ignore: must_be_immutable
class NegotiationPage extends StatelessWidget {
  final ActiveRequest activeRequest;
   final Negotiation negotiation;
   
    final GlobalKey<FormState>  _advanveFormKey= GlobalKey<FormState>();
  
  final GlobalKey<FormState> _negotiationFormKey = GlobalKey<FormState>();
  NegotiationPage({super.key, required this.activeRequest, required this.negotiation});

  final List<Map<String, String>> _conversationHistory = [];
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _advanceController = TextEditingController();
    final TextEditingController _advanceToPay = TextEditingController();
  late String? customerPrice = '0.0';
  String? initialDeposit;

  void _showHistory(BuildContext context) {
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
                        return Align(
                          alignment: isCustomer
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isCustomer
                                  ? Colors.blue[100]
                                  : Colors.green[100],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${entry["advance"]} as advance",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "Tsh ${entry["price"]}",
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
    return Consumer<CustomerController>(builder: (_, customerController, child) {
    print("replies ${negotiation.companyID}");
      return Scaffold(
        appBar: AppBar(
          title: const Text("Price Negotiation"),
          backgroundColor: const Color.fromARGB(255, 245, 222, 222),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  width: 400,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => _showHistory(context),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.purple,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                    ),
                    child: const Text(
                      "History",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 9),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(9),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 232, 201, 238),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                         negotiation.companyPrice.toString() 
                              ,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Tsh ${activeRequest.companyAdvanceAmountRequred.toString()} as advance",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (customerPrice != null &&
                      customerPrice!.isNotEmpty &&
                      initialDeposit != null &&
                      initialDeposit!.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.all(9),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 232, 201, 238),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                          topLeft: Radius.circular(12),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            customerPrice!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Tsh $initialDeposit as advance",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 15),
              if (customerController.showInputField)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Form(
                    key: _negotiationFormKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _priceController,
                          decoration: const InputDecoration(
                              labelText: "Enter your price"),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "This field cant be empty..";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: _advanceController,
                          keyboardType: TextInputType.number,
                          decoration:
                              const InputDecoration(labelText: "Advance"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter the Advance";
                            }
                            // else if (double.tryParse(value) != null && (double.tryParse(value)! < 0 || double.tryParse(value)! > 100)) {
                            //   return "Advance cannot be more than 100% or below 0%";
                            // }

                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (_negotiationFormKey.currentState!.validate()) {
                              customerPrice = _priceController.text;
                              initialDeposit = _advanceController.text;
                              // Create a new JobRequest object with details from ActiveRequest
                              JobRequest jobRequest = JobRequest(
                                jobRequestID: activeRequest.jobRequestID,
                                pickupLocation: activeRequest.pickupLocation,
                                deliveryLocation: activeRequest.deliveryLocation,
                                cargoDescription: activeRequest.cargoDescription,
                                containerNumber: activeRequest.containerNumber,
                                status: activeRequest.status,
                                priceAgreementID:negotiation.priceAgreementID,
                                truckType: activeRequest.truckType,
                                truckID: activeRequest.truckID ,
                                driverID: activeRequest.driverID ,
                                requestType: activeRequest.requestType,
                                customerID: activeRequest.customerID,
                                requestedPrice:negotiation.companyPrice,
                                customerPrice: double.tryParse(customerPrice!),
                                acceptedPrice:activeRequest.negotiations.last.agreedPrice,
                                companyID:negotiation.companyID,
                                contractId: activeRequest.contractId,
                                companyAdvanceAmountRequired:activeRequest.companyAdvanceAmountRequred,
                                firstDepositAmount: double.tryParse(initialDeposit!),
                              );

                              //send upadte
                              print(activeRequest.negotiations.last.companyID,);
                              final result = await customerController
                                  .updateJobRequestByJobrequestId(jobRequest);
                                  print(jobRequest.firstDepositAmount);
                                  print(jobRequest.customerPrice);
                              if (result == "success") {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Success"),
                                      content: const Text(
                                          "Negotiation has been sent successfully"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("OK"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Failed"),
                                      content: const Text(
                                          "Negotiation has been failed to send"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("OK"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                              _conversationHistory.add({
                                "price": activeRequest.priceAgreement!.companyPrice
                                    .toString(),
                                "advance": activeRequest.companyAdvanceAmountRequred
                                    .toString(),
                                "sender": "organization"
                              });

                              _conversationHistory.add({
                                "price": _priceController.text,
                                "advance": _advanceController.text,
                                "sender": "Customer"
                              });
                              customerController.toggleNegotiationField();
                              _priceController.clear();
                              _advanceController.clear();
                            }
                          },
                          child: const Text("Send Request"),
                        ),
                      ],
                    ),
                  ),
                ),
              const SizedBox(height: 30),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                ElevatedButton(
                  onPressed: customerController.toggleNegotiationField,
                  child: Text(customerController.isVisible ? 'Cancel' : 'Negotiate'),
                ),
                ElevatedButton(
                  onPressed: () async {
                   customerPrice = _priceController.text;
                              initialDeposit = _advanceController.text;
                              // Create a new JobRequest object with details from ActiveRequest
                              JobRequest jobRequest = JobRequest(
                                jobRequestID: activeRequest.jobRequestID,
                                pickupLocation: activeRequest.pickupLocation,
                                deliveryLocation: activeRequest.deliveryLocation,
                                cargoDescription: activeRequest.cargoDescription,
                                containerNumber: activeRequest.containerNumber,
                                status: activeRequest.status,
                                priceAgreementID:negotiation.priceAgreementID,
                                truckType: activeRequest.truckType,
                                truckID: activeRequest.truckID ,
                                driverID: activeRequest.driverID ,
                                requestType: activeRequest.requestType,
                                customerID: activeRequest.customerID,
                                requestedPrice:negotiation.companyPrice,
                                customerPrice: double.tryParse(customerPrice!),
                                acceptedPrice:negotiation.companyPrice,
                                companyID:negotiation.companyID,
                                contractId: activeRequest.contractId,
                                companyAdvanceAmountRequired:activeRequest.companyAdvanceAmountRequred,
                                firstDepositAmount: activeRequest.companyAdvanceAmountRequred,
                              );
  //send upadte
                    final result = await customerController
                        .updateJobRequestByJobrequestId(jobRequest);
                    if (result == "success") {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => DraggableScrollableSheet(
                                initialChildSize: 0.8,
                                maxChildSize: 1,
                                minChildSize: 0.6,
                                builder: (
                                  context,
                                  scrollController,
                                ) {
                                  return Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        )),
                                    child: ListView(
                                      controller: scrollController,
                                      children: [
                                        ListTile(
                                          title: const Text('Payment Agreements'),
                                          trailing: const Icon(
                                            Icons.close,
                                          ),
                                          onTap: () => (Navigator.pop(context)),
                                        ),
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(30),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                      239, 233, 218, 238),
                                                  borderRadius:
                                                      BorderRadius.circular(25)),
                                              child: Padding(
                                                padding: const EdgeInsets.all(20),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        const Text(
                                                          'First Deposit Amount',
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                        Form(
                                                          key: _advanveFormKey,
                                                            child: Column(
                                                          children: [
                                                            TextFormField(
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              controller:_advanceToPay,
                                                              decoration: const InputDecoration(
                                                                  border: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(15)))),
                                                                              validator: (value) {
                                                              if (value == null ){
                                                                return "Please Confirn your First Deposit";
                                                              }
                                                              else if (double.tryParse(value)! < double.tryParse(initialDeposit!)!) {
                                                                return "Your initial value Should be at least ${initialDeposit}";
                                                              }
                                                              return null; 
                                                                              },
                                                            ),
                                                            const SizedBox(
                                                              height: 30,
                                                            ),
                                                            ElevatedButton(
                                                                onPressed: () async {
                                                                if (_advanveFormKey.currentState!.validate()) {

                                                                  initialDeposit=_advanceToPay.text;

                                                                   customerPrice = _priceController.text;
                              initialDeposit = _advanceController.text;
                              // Create a new JobRequest object with details from ActiveRequest
                              JobRequest jobRequest = JobRequest(
                                jobRequestID: activeRequest.jobRequestID,
                                pickupLocation: activeRequest.pickupLocation,
                                deliveryLocation: activeRequest.deliveryLocation,
                                cargoDescription: activeRequest.cargoDescription,
                                containerNumber: activeRequest.containerNumber,
                                status: activeRequest.status,
                                priceAgreementID:negotiation.priceAgreementID,
                                truckType: activeRequest.truckType,
                                truckID: activeRequest.truckID ,
                                driverID: activeRequest.driverID ,
                                requestType: activeRequest.requestType,
                                customerID: activeRequest.customerID,
                                requestedPrice:negotiation.companyPrice,
                                customerPrice: double.tryParse(customerPrice!),
                                acceptedPrice: negotiation.companyPrice,
                                companyID:negotiation.companyID,
                                contractId: activeRequest.contractId,
                                companyAdvanceAmountRequired:activeRequest.companyAdvanceAmountRequred,
                                firstDepositAmount: double.tryParse(initialDeposit!),
                              );
                           await      customerController.updateJobRequestByJobrequestId(jobRequest);

                              if (result=="success") {
                                customerController.toggleIsChecked();
                                
                              }
                                                                }
                                                                },
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                  backgroundColor:
                                                                      Colors.purple,
                                                                      
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                15),
                                                                  ),
                                                                ),
                                                                
                                                                child: const Text(
                                                                  'Send',
                                                                  style: TextStyle(
                                                                    color:
                                                                        Colors.white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize: 20,
                                                                  ),
                                                                ))
                                                          ],
                                                        )),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    if (customerController
                                                        .isChecked)
                                                      Column(
                                                        children: [
                                                          const Text(
                                                            'CAMPANY CO LTD',
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 20),
                                                          ),
                                                          const Text(
                                                            'Request Descriptions:\n\n'
                                                            ' Hellow , Daniel Hussein\n'
                                                            'Thanks for having faithfull on us we highly exited to Deliver Your \n'
                                                            'Requestnumber: T121JJHKJKJG\n'
                                                            'FROM  DAR-ES-SALAAM \n'
                                                            'TO : CONGO\n'
                                                            'DATE: 12 january,2024\n'
                                                            'PAYMENT STATUS: PARTIAL\n'
                                                            'AMOUNT: 23,000,000\n',
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                color:
                                                                    Colors.black38),
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
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                color:
                                                                    Colors.black54),
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Checkbox(
                                                                  value: customerController
                                                                      .isAgree,
                                                                  onChanged:
                                                                      (bool? value) {
                                                                    customerController
                                                                        .toggleIsAgree();
                                                                  }),
                                                              const Text('I Agree')
                                                            ],
                                                          ),
                                                          if (customerController
                                                              .isAgree)
                                                            Column(
                                                              children: [
                                                                const SizedBox(
                                                                  height: 30,
                                                                ),
                                                                ElevatedButton(
                                                                    onPressed:
                                                                        () {},
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      backgroundColor:
                                                                          Colors.purple,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                15),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        const Text(
                                                                      'Continue',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            20,
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
                              ));
                    }
                  },
                  child: const Text("Confirm"),
                ),
              ])
            ],
          ),
        ),
      );
    });
  }
}