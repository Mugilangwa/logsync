import 'package:flutter/material.dart';
import 'package:logisync_mobile/views/Drivers/function.dart';
import 'package:logisync_mobile/views/Drivers/homepage.dart';


class DriverHome extends StatefulWidget{
  const DriverHome({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DriverHomeState createState()=> _DriverHomeState();
}


class _DriverHomeState extends State<DriverHome>{
   int _selectedIndex = 0;

   void _onItemTapped(int index){
  setState(() {
        _selectedIndex = index;
  });
   }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      backgroundColor:Colors.white,
      appBar:AppBar(
        backgroundColor: Colors.white,
        leading: const CircleAvatar(),
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Welcome, daniel ',
              style: TextStyle(
                color: Colors.purple,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
             Text(
              'Location ',
              style: TextStyle(
                 color: Colors.purple,
                fontSize: 15,
                fontStyle: FontStyle.italic,
              )
              ),
          ],
        ),
       actions: [
        IconButton(onPressed:(){
          showCustomModal(context);
            } ,
        icon: const Icon(Icons.notifications))
       ],
        )
, bottomNavigationBar: BottomAppBar(
  color: Colors.white,
  shape: const CircularNotchedRectangle( 
  ),
  notchMargin: 8.0,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
         _buildNavItem(Icons.home, 'Home', 0),
         _buildNavItem(Icons.work, 'Job',1 ),
         _buildNavItem(Icons.person, 'Profile', 2)
    ],
  ),
),

body: IndexedStack(
  index: _selectedIndex,
  children: const <Widget>[
  DriverHomePage(),
         // Center(child: Text('jobs',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
      Center(child: Text('profile',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
       Center(child: Text('jobs',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
  ],
),
    );
   }

Widget _buildNavItem(IconData icon ,String label ,int index){

  return GestureDetector(
    onTap: () {
      _onItemTapped(index);
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Icon(
            icon,
            color: _selectedIndex == index? Colors.purple : Colors.black,
          ),
          const SizedBox(height:5),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: _selectedIndex == index? Colors.purple : Colors.black,
            ),
          )
        ],
      ), 
      ),

  );

 }
}