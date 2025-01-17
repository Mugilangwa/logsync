import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logisync_mobile/controllers/customer/registerandlogin.dart';
import 'package:logisync_mobile/controllers/customerController.dart';
import 'package:logisync_mobile/shared/session_manager.dart';
import 'package:logisync_mobile/views/customer/homepage.dart';
import 'package:logisync_mobile/views/customer/prerequests.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


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
String? _userName ;

@override
void initState(){
  super.initState();
  checkLoginStatus(context);
  _loadUserData();
}

//for checking if user is logged in or not
void checkLoginStatus(BuildContext context) async {
  final isLoggedIn= await SessionManager.isLoggedIn();
  if (!isLoggedIn) {
   GoRouter.of(context).go('/account/login');
  }
}
 
 Future<void> _loadUserData() async{
  final prefs= await SharedPreferences.getInstance();
  setState(() {
    _userName= prefs.getString('user_name');
  });
 }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: 
        Consumer<CustomerController>(
          builder: (context, CustomerController,child) {
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
                       CustomerController.customerUsename,
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
            _buildNavItem(Icons.home , "Home", 0),
             
            _buildNavItem(Icons.request_page_sharp, "Request", 1),
           
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

