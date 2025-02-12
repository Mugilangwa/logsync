import 'package:flutter/material.dart';
//import 'live_tracking.dart';

class TrackingDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Tracking Details", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body:
       Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                      children: [
                        const Icon(Icons.laptop, color: Colors.orange, size: 40),
                        const SizedBox(width: 10),
                       Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Macbook Pro M2", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical:10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Row(
                     
                      children: [
                        _buildInfoRow("From:", "Mirpur 11, Dhaka"),
                     const   Spacer(),
                        _buildInfoRow("Destination:", "Chittagong"),
                      ],
                    ),
                     const SizedBox(height: 15),
                    Row(
                      children: [
                        _buildInfoRow("Customer:", "daniel"),
                      const  Spacer(),
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

  // 📌 Method to build tracking info rows
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
           style: const TextStyle(
            color: Colors.black54,
            fontSize: 15,
            fontStyle: FontStyle.italic
            )),
          const SizedBox(height:3),
          Text(value, 
          style: TextStyle(
            fontWeight: FontWeight.bold,
             color: Colors.black.withOpacity(0.8),
              fontSize: 18,
             )),
          
          
        ],
      ),
    );
  }

  // 📌 Status Tag
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
}
