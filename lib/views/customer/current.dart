import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:logisync_mobile/controllers/customerController.dart';
import 'package:logisync_mobile/views/customer/negotiation.dart';
import 'package:provider/provider.dart';
import '../../model/customer/jobRequest.dart';
import '../../shared/constants.dart';
import 'replies.dart';

class Current extends StatelessWidget {
  final requestFormKey = GlobalKey<FormState>();

  Current({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomerController>(builder: (context, customerController, _) {
      customerController.getCustomerJobRequest(customerController.customerID!);
      return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ScrollConfiguration(
            behavior: NoScrollbarBehavior(),
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Text(
                          'Customer Tickets',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                      //  if(customerController.isLoading)
                      //   const CircularProgressIndicator()
                      //   else
                        // Data Rows as Cards
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: customerController.listOfJobsRequested.length,
                          itemBuilder: (context, index) {
                            final job = customerController.listOfJobsRequested[index];
                            String formattedDate = Functions.formatDateTime(job.cdate.toString());
                                
                           // Filter valid negotiations
                            final validNegotiations = job.negotiations
                                .where((negotiation) =>negotiation.companyPrice !=0 || negotiation.companyID !=null)
                                .toList();
                            int numberOfReplies = validNegotiations.length;
                           if(  customerController.isLoading){
                          const  CircularProgressIndicator();
                           }
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              
                              margin: const EdgeInsets.symmetric(vertical: 8 ,horizontal: 10),
                             child: ListTile(
  onTap: () async {
  final request = await customerController.getJobRequestById(job.jobRequestID);
   
  if (request != null) {
    final filteredNegotiations = request.negotiations
        .where((negotiation) => negotiation.companyPrice != 0 && negotiation.companyID != null)
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RepliesScreen(
          request: request,
          filteredNegotiations: filteredNegotiations,
        ),
      ),
    );
  } else {
    showDialog(
           context:context, 
           builder: (abs)=> AlertDialog(
           title: const Text("Request Results"),
          content:const Text('Failed to retrieve job request'),
          actions: [
         TextButton(
       onPressed: () => Navigator.of(abs).pop(),
        child: const Text("OK"))
      ],
     )
    );

    
  }
},

  title: Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            job.jobRequestID,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          if (job.status == "CREATED")
            Chip(
              label: Text(
                job.status,
                style: const TextStyle(color: Colors.white, fontSize: 10),
              ),
              backgroundColor: Colors.red,
            )
          else if (job.status == "READY TO SERVE")
            Chip(
              label: Text(
                job.status,
                style: const TextStyle(color: Colors.white, fontSize: 10),
              ),
              backgroundColor: Colors.blue,
            )
          else
            Chip(
              label: Text(
                job.status,
                style: const TextStyle(color: Colors.white, fontSize: 10),
              ),
              backgroundColor: Colors.amber,
            ),
        ],
      ),
      const SizedBox(height: 3),
      const Divider(
        color: Color.fromARGB(255, 215, 133, 230),
        thickness: 1,
      ),
    ],
  ),
  subtitle: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              Text(
                job.pickupLocation,
                style: const TextStyle(color: Colors.black, fontSize: 15),
              ),
            ],
          ),
          const SizedBox(width: 6),
          const Icon(
            Icons.arrow_forward,
            size: 18,
            color: Colors.black,
          ),
          const SizedBox(width: 6),
          Column(
            children: [
              Text(
                job.deliveryLocation,
                style: const TextStyle(color: Colors.black, fontSize: 15),
              ),
            ],
          )
        ],
      ),
      Text(
        '$numberOfReplies replies',
        style: const TextStyle(
          fontSize: 13,
          color: Colors.amber,
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            formattedDate,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.grey,
              fontStyle: FontStyle.italic,
            ),
          ),
           Row(
             children: [
               Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12)
                ),
                 child: IconButton(
                         onPressed:()  async{
                 customerController.deleteActiveRequest(job.jobRequestID);
                         }
                       , icon:const Icon(Icons.delete_rounded,color: Colors.red,)),
               ),
                      Container(
                        decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12)
                ),
                        child: IconButton(
                                onPressed:()  async{
                             }
                              , icon:const Icon(Icons.edit_rounded,color: Colors.blue,)),
                      )
    
             ],
           )
    
        ],
      ),

    ],
  ),
),
 );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

class RepliesScreen extends StatelessWidget {
  final ActiveRequest request;
  final List<Negotiation> filteredNegotiations;

  const RepliesScreen({super.key, required this.request, required this.filteredNegotiations});

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomerController>(builder: (context, customerController, _) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent,
          title: const Text(
            'Company Replies',
            style: TextStyle(color: Colors.amber),
          ),
          toolbarHeight: 150,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(21),
              bottomRight: Radius.circular(21),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ScrollConfiguration(
            behavior: NoScrollbarBehavior(),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (filteredNegotiations.isEmpty)
                    const Center(
                      child: Text(
                        'Your request is not yet replied.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    )
                  else
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filteredNegotiations.length,
                      itemBuilder: (context, index) {
                        final negotiation = filteredNegotiations[index];
                        
                        if (negotiation.companyID != null) {
                          customerController.getAllCompany(negotiation.companyID!);
                        }

                        // if (customerController.isLoading) {
                        //   return const Center(child: CircularProgressIndicator());
                        // }
                        
                        final company = customerController.allCompany;
                       
                        if (company == null) {
                          return const Center(child: Text('Failed to load company details.'));
                        }

                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  company.companyName ,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      request.pickupLocation,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w200,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    const Icon(Icons.arrow_forward),
                                    Text(
                                      request.deliveryLocation,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w200,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'TSH ${negotiation.companyPrice.toString()}',
                                  style: const TextStyle(
                                    color: Colors.purple,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                                Chip(
                                  label: Text(
                                    company.companyAddress,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  backgroundColor: Colors.white,
                                ),
                              ],
                            ),
                            onTap: () {
                            
                           
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NegotiationPage(
                                  negotiation:negotiation,
                                  activeRequest: request,
                                ),
                              ),
                            );
                          ;
                            }
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class NoScrollbarBehavior extends ScrollBehavior {
  @override
  Widget buildScrollbar(BuildContext context, Widget child, ScrollableDetails details) {
    return child; // Return the child without a scrollbar
  }
}