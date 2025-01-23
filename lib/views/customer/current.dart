import 'package:flutter/material.dart';
import 'package:logisync_mobile/controllers/customerController.dart';
import 'package:logisync_mobile/views/customer/negotiation.dart';
import 'package:logisync_mobile/views/customer/replies.dart';
import 'package:provider/provider.dart';

import '../../model/customer/jobRequest.dart';
import '../../shared/constants.dart';

// ignore: must_be_immutablecurrent
class Current extends StatelessWidget {
  final requestFormKey = GlobalKey<FormState>();

  Current({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<CustomerController>(
        builder: (context, customerController, _) {
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Heading
                        const Text(
                          'Customer Tickets',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Data Rows as Cards
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:customerController.listOfJobsRequested.length,
                          itemBuilder: (context, index) {
                            final job =customerController.listOfJobsRequested[index];
                            customerController.getJobRequestById(job.jobRequestID);
                            String formattedDate =  Functions.formatDateTime(job.cdate.toString());
                            int replies = job.negotiations.length;
                            int numberOfReplies = replies;
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 4,
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              child: ListTile(
                                onTap: () async {
                                  customerController.getJobRequestById(job.jobRequestID);
                                  final request = customerController.listOfCompanyReplied.firstWhere(
                                    (req) =>
                                        req.jobRequestID == job.jobRequestID,
                                    // Provide a default ActiveRequest instance
                                  );

                                  // If the request exists
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        final filteredNegotiations = request.negotiations
                                            .where((negotiation) => negotiation.companyPrice != 0 && negotiation.companyID != null)
                                            .toList();

                                        return Scaffold(
                                          appBar: AppBar(
                                            title: const Text('Number of Replies'),
                                          ),
                                          body: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [                                               
                                                filteredNegotiations.isEmpty
                                                    ? const Center(
                                                      child: Padding(
                                                          padding: EdgeInsets.all(16.0),
                                                          child: Text(
                                                            'Current Your Request has not replies yet...'
                                                           ' Please wait for the companies to reply',
                                                            textAlign: TextAlign.center,
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                    )
                                                    : ListView.builder(
                                                        shrinkWrap: true,
                                                        physics: const NeverScrollableScrollPhysics(),
                                                        itemCount: filteredNegotiations.length,
                                                        itemBuilder: (context, index) {
                                                          final negotiation = filteredNegotiations[index];
                                                          return Card(
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(8),
                                                            ),
                                                            child: ListTile(
                                                              title: Text('Company: ${negotiation.companyID}'),
                                                              trailing: Text('Price: ${negotiation.companyPrice}'),
                                                            ),
                                                          );
                                                        },
                                                                                                                
                                                           
                                                                                                                 ),          
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${job.jobRequestID}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      '$formattedDate',
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    )
                                  ],
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${numberOfReplies} Replies',
                                      style:
                                          const TextStyle(color: Colors.amber),
                                    ),
                                    Text(
                                      'Status: ${job.status}',
                                      style:
                                          const TextStyle(color: Colors.amber),
                                    ),
                                  ],
                                ),
                                trailing: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                ),
                              ),
                            );
                          },
                        ),
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

class NoScrollbarBehavior extends ScrollBehavior {
  @override
  Widget buildScrollbar(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child; // Return the child without a scrollbar
  }
}
