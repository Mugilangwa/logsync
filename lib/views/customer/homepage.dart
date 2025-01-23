import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:logisync_mobile/controllers/customerController.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
 const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  

  @override
  void initState() {
    super.initState();
    final customerController = Provider.of<CustomerController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomerController>(builder: (context, customerController, _) {
      return Stack(
        children: [
        GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(0, 0),
                    zoom: 14.4746,
                  ),
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  onMapCreated:(GoogleMapController controller){
      



                },
               ),

        Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 12),
                    child: Container(
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.purple,
                      ),
                      child:const Padding(
                        padding:  EdgeInsets.symmetric(horizontal:20,vertical: 10),
                        child: Row(
                          children:  [
                            Icon(Icons.search, color: Colors.white),
                            SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: 'Search with your Request ID',
                                  hintStyle: TextStyle(color: Colors.white70),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

        DraggableScrollableSheet(
          
          initialChildSize: 0.3,
          maxChildSize: 1.0,
          minChildSize: 0.2,
          builder: (context, scrollController) {
            return
            SafeArea(

              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 179, 133, 218),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child:Padding(

                  padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
                  child: Column(
                    children: [
                        Expanded(
                  child: 
                  ListView.builder(
                    itemCount: customerController.listOfJobsRequested.length,
                    itemBuilder: (context, index) {
                      final jobDetails = customerController.listOfJobsRequested[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 2,
                          child: ListTile(
                            title: const Text(
                              'Active Request',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text('sadas'),
                            trailing: const Icon(Icons.arrow_forward, color: Colors.purple),
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) {
                                  return DraggableScrollableSheet(
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
                                        child: ListView(
                                          controller: scrollController,
                                          children: [
                                            ListTile(
                                              title: const Text('Request Description'),
                                              trailing: const Icon(Icons.close),
                                              tileColor: Colors.purple,
                                              onTap: () => Navigator.pop(context),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(20),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                   Text(
                                                        'Driver Name:',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                                                                    const SizedBox(height: 20),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(builder: (context) => const TrackCargo()),
                                                      );
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor: Colors.purple,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(15),
                                                      ),
                                                    ),
                                                    child: const Text(
                                                      'Live Tracking',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
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
                ) ,
                )
              );
          }
           ),
        ]
      );
        
         });
  }
}

// Live Tracking Page
class TrackCargo extends StatelessWidget {
  const TrackCargo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Tracking'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Go Back'),
        ),
      ),
    );
  }
}
