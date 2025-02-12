import 'package:flutter/material.dart';
import 'package:logisync_mobile/controllers/customerController.dart';
import 'package:logisync_mobile/views/customer/homepage.dart';
import 'package:logisync_mobile/views/customer/prerequests.dart';
import 'package:provider/provider.dart';


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

//code for appbar data 


@override
void initState(){
  super.initState(  
  );
  final customerController = Provider.of<CustomerController>(context,listen: false);
   customerController.checkLoginStatus(context);
   customerController.loadUserData();
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: 
        Consumer<CustomerController>(
          builder: (context, customerController,child) {
            return
               Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
             Row(
             
              children: [
                const CircleAvatar(
                  backgroundColor: Color.fromARGB(11, 219, 42, 26),
                  radius: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      customerController.customerUsername ?? '',
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                      ),
                     ),
                    const Text(
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
        );
      
          }
        )
       ),
      // Bottom navigation bar with floating action button in the center
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0, // Margin for the floating action button
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distributes space equally
          children: <Widget>[
            _buildNavItem(Icons.home_rounded , "Home", 0),
             
            _buildNavItem(Icons.request_page_rounded, "Request", 1),
           
            _buildNavItem(Icons.payment_sharp, "Payment", 2),
          
            _buildNavItem(Icons.person_2, "Account", 3),
          
          ],
        ),
      ),

      // Floating action button in the center
      floatingActionButton: FloatingActionButton(
        heroTag:'uniqueTag1' ,
        onPressed: () {
           Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  CollapsibleForm ()));
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
                     const SizedBox(height:4), // Vertical spacing between icon and text
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

