import 'package:flutter/material.dart';
import 'package:logisync_mobile/views/customer/replies.dart';

// ignore: must_be_immutable
class Current extends StatelessWidget {
  final requestFormKey = GlobalKey<FormState>();

  Current({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ScrollConfiguration(
          behavior: NoScrollbarBehavior(),
          child: SingleChildScrollView(
              child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(9),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius:  BorderRadius.circular(9)
                        )
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Replies()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8),
                            child: Text('Request ID'),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 4),
                            child: Column(

                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ButtonTheme(
                                  child: const Text('status',
                                   style: TextStyle(
                                          fontSize: 15 ,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.amber,
                                          ),)),
                                const  SizedBox(height: 7,),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/icon/logistic-company.png',
                                      width: 25,
                                      height: 20,
                                    ),
                                    const Row(
                                  children: [
                                    Text(
                                      '0',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                   
                                    Text(
                                      'replies',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black45),
                                    ),
                                  ],
                                ),
                           
                                  ],
                                ),
                                const SizedBox(width: 3),
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
          )),
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
