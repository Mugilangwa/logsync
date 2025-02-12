import 'dart:async';
import 'dart:math';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:logisync_mobile/controllers/customerController.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logisync_mobile/views/customer/current.dart';
import 'package:provider/provider.dart';

import 'negotiation.dart';
import 'trackcargo.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    _timer = Timer.periodic(const Duration(seconds: 6), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomerController>(builder: (context, customerController, _) {
      customerController.getCustomerJobRequest(customerController.customerID!);
      return Stack(
        children: [
          // GoogleMap(
          //           initialCameraPosition: CameraPosition(
          //             target: LatLng(0, 0),
          //             zoom: 14.4746,
          //           ),
          //           myLocationButtonEnabled: true,
          //           myLocationEnabled: true,
          //           onMapCreated:(GoogleMapController controller){

          //         },
          //        ),

        Padding(
  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
  child: Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.purple,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10), // Ensures rounded corners
          child: SizedBox(
            height: 90, // Adjust height to fit your layout
            width: double.infinity, // Ensures the image covers the entire container
            child: PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              children: [
                // const Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(
                //       "Track your package",
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 18,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //     Text(
                //       "See the way of Your Delivery",
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 12,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ],
                // ),
                
                Image.asset(
                  'assets/banner.jpg',
                  fit: BoxFit.cover, // Ensures the image fills the space
                  width: double.infinity,
                ),
                Image.asset(
                  'assets/banner1.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Image.asset(
                  'assets/banner2.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                
              ],
            ),
          ),
        ),
        const SizedBox(height: 15),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                spreadRadius: 1,
              ),
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Tracking number",
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              suffixIcon: IconButton(
                icon: const Icon(Icons.search_off_rounded, color: Colors.orange),
                onPressed: () {
                  // Handle tracking button press
                },
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            ),
          ),
        ),
      ],
    ),
  ),
),
 const SizedBox(height: 20),
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            maxChildSize: 1.0,
            minChildSize: 0.2,
            builder: (context, scrollController) {
              return SafeArea(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 179, 133, 218).withOpacity(0.1),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        Expanded(
                          child: PageView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: customerController.listOfJobsRequested.length,
                            itemBuilder: (context, index) {
                              final particularJobRequest = customerController.listOfJobsRequested[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Card(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 2,
                                  child: ListTile(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    title: Column(
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(Icons.card_giftcard_rounded, color: Colors.orange, size: 40),
                                            const SizedBox(width: 10),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(particularJobRequest.jobRequestID, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                                Text(particularJobRequest.jobRequestID, style: TextStyle(color: Colors.grey[600])),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 50),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Icon(Icons.radio_button_checked_rounded, color: Colors.purple),
                                                  _buldDottedLine(),
                                                  const Icon(Icons.radio_button_checked_rounded, color: Colors.amber),
                                                ],
                                              ),
                                              const SizedBox(width: 3),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  _buildInfoRow("Pickup Point", particularJobRequest.pickupLocation),
                                                  _buildInfoRow("Drop Point", particularJobRequest.deliveryLocation),
                                                ],
                                              ),
                                              const Spacer(flex: 4),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  _buildInfoRow("Status", "in car"),
                                                  _buildInfoRow("Price", " 112322"),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    onTap: () async {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        builder: (context) {
                                          return ScrollConfiguration(
                                            behavior: NoScrollbarBehavior(),
                                            child: DraggableScrollableSheet(
                                              initialChildSize: 0.8,
                                              maxChildSize: 1.0,
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
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(20),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        ListTile(
                                                          title: const Text('Request Description'),
                                                          trailing: const Icon(Icons.close, color: Colors.purple),
                                                          tileColor: Colors.purple,
                                                          onTap: () => Navigator.pop(context),
                                                        ),
                                                        const Divider(
                                                          color: Colors.amber,
                                                          thickness: sqrt1_2,
                                                        ),
                                                        const SizedBox(height: 7),
                                                        Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                                          child: Row(
                                                            children: [
                                                              const Icon(Icons.laptop, color: Colors.orange, size: 40),
                                                              const SizedBox(width: 10),
                                                              Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(particularJobRequest.jobRequestID, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                                                  Text("#Tracking ID: H123135461235", style: TextStyle(color: Colors.grey[600])),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(height: 15),
                                                        // 📦 Package Information
                                                        Container(
                                                          padding: const EdgeInsets.all(15),
                                                          decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius: BorderRadius.circular(15),
                                                            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    _buildInfoRow("From:", particularJobRequest.pickupLocation),
                                                                    const Spacer(),
                                                                    _buildInfoRow("Destination:", particularJobRequest.deliveryLocation),
                                                                  ],
                                                                ),
                                                                const SizedBox(height: 15),
                                                                Row(
                                                                  children: [
                                                                    _buildInfoRow("Customer:", particularJobRequest.customer!.fullName),
                                                                    const Spacer(),
                                                                    _buildInfoRow("Weight:", "2.40 KG"),
                                                                  ],
                                                                ),
                                                                const SizedBox(height: 10),
                                                                _buildStatusTag("In Transit"),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(height: 20),
                                                        // 🚚 Tracking Timeline
                                                        const Text("Tracking Updates", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                                        const SizedBox(height: 10),
                                                        Expanded(
                                                          child: ListView(
                                                            children: [
                                                              _buildTrackingStep("Tracking Number Created", "3/04 Mirpur 11, Dhaka"),
                                                              _buildTrackingStep("In Transit", "3/04 Mirpur 11, Dhaka"),
                                                              _buildTrackingStep("Out for Delivery", "Pending..."),
                                                              _buildTrackingStep("Delivered", "Pending..."),
                                                            ],
                                                          ),
                                                        ),
                                                        // 🔵 Live Tracking Button
                                                        ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                            backgroundColor: Colors.purple,
                                                            padding: const EdgeInsets.all(15),
                                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                                          ),
                                                          onPressed: () {
                                                            //   Navigator.push(context, MaterialPageRoute(builder: (context) => LiveTrackingPage()));
                                                          },
                                                          child: const Center(child: Text("Live Tracking", style: TextStyle(color: Colors.white, fontSize: 16))),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
              }
              

            ),
          
        ],
      );
      });
    }
  }


// 📌 Method to build each tracking row
Widget _buildTrackingStep(String title, String subtitle) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, bottom: 15),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.check_circle, color: Colors.blue, size: 20),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(subtitle, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
          ],
        ),
      ],
    ),
  );
}

//  Method to build tracking info rows
Widget _buildInfoRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label.toUpperCase(),
            style: const TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontStyle: FontStyle.normal)),
        const SizedBox(height: 2),
        Text(value.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.8),
              fontSize: 18,
            )),
      ],
    ),
  );
}

//  Status Tag
Widget _buildStatusTag(String status) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
      color: Colors.blue.withOpacity(0.1),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Text(status, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
  );
}

//location with row 
Widget _buildLocationRow(String label, String value) {
  return Row(
    children: [
      const Icon(Icons.radio_button_checked),
      const SizedBox(width: 5),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.black54,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 17,
              color: Colors.black,
            ),
          ),
        ],
      ),
    ],
  );
}

//dotted line 
Widget _buldDottedLine() {
  return const Padding(
    padding: EdgeInsets.only(left: 10, top: 0, bottom: 5),
    child: SizedBox(
      height: 30,
      child: DottedLine(
        dashColor: Colors.purple,
        direction: Axis.vertical,
        lineLength: double.infinity,
        dashLength: 2,
        lineThickness: 4,
      ),
    ),
  );
}