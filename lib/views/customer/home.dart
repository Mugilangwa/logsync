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
      backgroundColor:const Color.fromARGB(82, 232, 179, 243),
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
                Text(
                  'Welcome, User',
                  style: TextStyle(
                    fontSize: 14,
                  ),
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
            _buildNavItem('assets/icon/home.png', "Home", 0),
            _buildNavItem('assets/icon/form.png', "Request", 1),
            const Spacer(), // Spacer between the left and right sections
            _buildNavItem('assets/icon/cash-on-delivery.png', "Payment", 2),
            _buildNavItem('assets/icon/invoice.png', "Invoice", 3),
          ],
        ),
      ),

      // Floating action button in the center
      floatingActionButton: FloatingActionButton(
        heroTag:'uniqueTag1' ,
        onPressed: () {
          // print("Central button pressed");
        }, // Use central icon
        backgroundColor: Colors.purple,
        child: const Icon(Icons.map),
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

  Widget _buildNavItem(String iconpath, String label, int index) {
    return GestureDetector(
      onTap: () {
        _onItemTapped(index);
        
      
      },
      
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0), // Even padding between items
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 60,
               height: 20,
                child: Column(
                  children: [
                    Image.asset(
                      iconpath,
                    //  color: _selectedIndex == index ? Colors.purple: Colors.black,
                      
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
               
              ),
             
            ],
          ),
        ),
      );
  }
}

