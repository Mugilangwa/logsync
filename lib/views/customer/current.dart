import 'package:flutter/material.dart';
import 'package:logisync_mobile/views/customer/replies.dart';

// ignore: must_be_immutable
class Current extends StatelessWidget {
  final requestFormKey = GlobalKey<FormState>();

    Current({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 185, 235),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,vertical: 8),
        child: ScrollConfiguration(
              behavior: NoScrollbarBehavior(),
              child: SingleChildScrollView(
                child: Center(
                  child: Container(
                   
                    decoration: BoxDecoration(
                            color:Colors.white,
                            borderRadius: BorderRadius.circular(9),
                          ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: 
                        [
                           
                       ElevatedButton(
  style: const ButtonStyle(
  
  ),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Replies()),
    );
  },
  child: Column(
    children: [
      const Padding(
        padding: EdgeInsets.all(8),
        child: Text('Request ID'),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'assets/icon/logistic-company.png',
              width: 45,
              height: 30,
            ),
            const SizedBox(width: 3),
            const Text(
              '0',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ],
  ),
)

                        ],
                        
                        ),
                      
                    ),
                  ),
                )
        
            ),
          ),
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




          


