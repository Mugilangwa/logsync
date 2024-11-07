import 'package:flutter/material.dart';
import 'package:logisync_mobile/views/customer/homepage.dart';
import 'package:logisync_mobile/views/customer/prerequests.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 185, 235),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
             
              children: [
                CircleAvatar(
                  backgroundColor: Color.fromARGB(11, 219, 42, 26),
                  radius: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome, User',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                      ),
                     ),
                    Text(
                      'Location,Bunju Beach',
                      style: TextStyle(
                        fontSize: 14,
                        fontStyle:FontStyle.italic
                      ),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            )
          ],
        ),
      ),
      // Bottom navigation bar with floating action button in the center
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0, // Margin for the floating action button
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distributes space equally
          children: <Widget>[
            _buildNavItem(Icons.home , "Home", 0),
            _buildNavItem(Icons.request_page_sharp, "Request", 1),
            const Spacer(), // Spacer between the left and right sections
            _buildNavItem(Icons.payment_sharp, "Payment", 2),
            _buildNavItem(Icons.description, "Invoice", 3),
          ],
        ),
      ),

      // Floating action button in the center
      floatingActionButton: FloatingActionButton(
        heroTag:'uniqueTag1' ,
        onPressed: () {
           Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CollapsibleForm ()));
        }, // Use central icon
        backgroundColor: Colors.purple,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Use IndexedStack to maintain state of the pages
      body: 
        IndexedStack(
        index: _selectedIndex, // Show the currently selected page
        children: const <Widget>[
          Homepage(),
          PreRequest(),
          Center(child: Text(' huseein', style: TextStyle(fontSize: 24))),
          Center(child: Text('daniel huseein', style: TextStyle(fontSize: 24))),
         
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () {
        _onItemTapped(index);
        
      
      },
      
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0), // Even padding between items
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
             Column(
                  children: [
                   Icon(
                   icon,
                   color: _selectedIndex == index ? Colors.purple: Colors.black,
                      
                    ),
                     const SizedBox(height: 4), // Vertical spacing between icon and text
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: _selectedIndex == index ? Colors.purple:Colors.black,
                ),
              ),
                  ],
                )
               
             
             
            ],
          ),
        ),
      );
  }
}

