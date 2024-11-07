import 'package:flutter/material.dart';
import 'package:logisync_mobile/views/customer/current.dart';

class PreRequest extends StatelessWidget {
  const PreRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
              bottom: const TabBar(
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
        // floatingActionButton: FloatingActionButton(
        //   heroTag: 'uniqueTag2', // Ensure this tag is unique
          
        //   hoverColor: Colors.purple,
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => const CollapsibleForm ()),
        //     );
        //   },
        //   child: const Icon(Icons.add),
        // ),
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
 
 class CarType{
  final String image;
  final String label;

  CarType({required this.image, required this.label});
 }

class CollapsibleForm extends StatefulWidget {
  const CollapsibleForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CollapsibleFormState createState() => _CollapsibleFormState();
}

class _CollapsibleFormState extends State<CollapsibleForm> {
  List<bool> isExpandedList = List.filled(3, false); // Assuming there are 3 sections

int selectedcar = -1;
// list of cartypes
final List<CarType> cartypes = [
  CarType(image:'assets/truck/fast-delivery.png', label: 'moto ride'),
  CarType(image:'assets/truck/bajaji.png', label: 'Tuk-tuk'),
  CarType(image:'assets/truck/tuktuk.png', label: 'Bajaji'),
  CarType(image:'assets/truck/van.png', label: 'Van'),
  CarType(image:'assets/truck/pickup-truck.png', label: 'Pick-Up'),
  CarType(image:'assets/truck/truck.png', label: 'Truck'),
  CarType(image:'assets/truck/box-truck.png', label: 'Box truck'),
  CarType(image:'assets/truck/transport.png', label: 'FlatBed '),
  CarType(image:'assets/truck/container.png', label: 'Container'),
  
];
  @override
  Widget build(BuildContext context) {
    return 
   Scaffold(
     appBar: AppBar(title: const Text('Request Details')),
      body:
       ScrollConfiguration(
        behavior: NoScrollbarBehavior(),
        child: SingleChildScrollView(
          child: Form(
            
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
                                   onPressed: () {},
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
                                   onPressed: () {},
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
          ),
        ),
      ),
    );
  }

  // Function to provide specific titles based on the index
  String _getTitleForIndex(int index) {
    switch (index) {
      case 0:
        return 'Location Detail';
      case 1:
        return 'Cargo Details';
      case 2:
        return 'Select a Car';
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
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: TextFormField(
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
                decoration: InputDecoration(
                  labelText: 'Cargo Type',
                  hintText: 'Enter cargo type',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.purple),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: TextFormField(
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
              ),
            ),
          ],
        );

      case 2:
        // ignore: avoid_unnecessary_containers
        return Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 4),
             child:  SizedBox(
              height: 400,
               child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1.0),
               itemCount: cartypes.length,
               itemBuilder:(context,index) {
                  return ElevatedButton(
                    onPressed:(){
                      setState(() {
                        selectedcar=index;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                       backgroundColor: selectedcar == index ? Colors.purple :Colors.white,
                       foregroundColor: selectedcar == index ? Colors.white : Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                      )
                    ),
                     child:Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                               Image.asset(
                                cartypes[index].image,
                                height: 100,
                                width: 100,
                               ),
                               Text(
                                cartypes[index].label,
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
        );

      default:
        return Container();
    }
  }
}




