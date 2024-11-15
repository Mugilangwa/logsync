import 'package:flutter/material.dart';

class DriverHomePage extends StatelessWidget {
  DriverHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 185, 235),

        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        //   hoverColor: Colors.purple,
        //   hoverElevation: 23,
        //   child: const Icon(Icons.message),
        // ),
         body: Center(
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 15, vertical: 10),
              child:
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                    Expanded(
                    flex: 1,
                    child: Container(
                       decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(20)
                    ),
                      child: const Column(
                        children: [
                          Text(
                            'Job Id',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Text('Pickup location'),
                              Text('-'),
                              Text('Dropup Location'),
                            ],
                          )
                        ],
                      ),
                    ),
                                    ),
                    Expanded(
                    flex: 7,
                    child: Stack(
                      clipBehavior: Clip
                          .none, // allows widgets to be positioned outside the stack
                      children: [
                        // Main Container
                        Container(
                            decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child:const Center(
                            child: Text(
                              'Main Container',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        // Circular Buttons
                        Positioned(
                          bottom: 10, // Position outside the container
                          right: 23,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              FloatingActionButton(
                                heroTag: 'call',
                                mini: true,
                                onPressed: () {
                                
                                 showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,

                    builder: (context) => DraggableScrollableSheet(
                      initialChildSize: 0.8,
                      maxChildSize: 1.0,
                      minChildSize: 0.6,

                      builder:(context, scrollController) {
                        return Container(

                          decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),)
                          ),
                          child: ListView(
                            controller: scrollController,
                            children: [
                              ListTile(
                                title: Text('page Title'),
                                trailing: Icon(Icons.close),
                                onTap: () => (
                                  Navigator.pop(context)
                                ),

                              ),
                               const Padding
                              (padding:EdgeInsets.all(16) ,
                              child: Text('call detaild'),)

                            ],
                          ),
                        );
                      } )
                      );
                   
                                },
                                child: const Icon(Icons.call),
                              ),
                              const SizedBox(width: 10),
                              FloatingActionButton(
                                heroTag:'info',
                                mini: true,
                                onPressed: () {

                                   showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,

                    builder: (context) => DraggableScrollableSheet(
                      initialChildSize: 0.8,
                      maxChildSize: 1.0,
                      minChildSize: 0.6,

                      builder:(context, scrollController) {
                        return Container(

                          decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),)
                          ),
                          child: ListView(
                            controller: scrollController,
                            children: [
                              ListTile(
                                title: Text('page Title'),
                                trailing: Icon(Icons.close),
                                onTap: () => (
                                  Navigator.pop(context)
                                ),

                              ),
                               const Padding
                              (padding:EdgeInsets.all(16) ,
                              child: Text('chatting'),)

                            ],
                          ),
                        );
                      } )
                      );
                   
                                },
                                child: const Icon(Icons.message),
                              ),
                              const SizedBox(width: 10),
                              FloatingActionButton(
                               heroTag:'message',
                                mini: true,
                                onPressed: () {

                                   showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,

                    builder: (context) => DraggableScrollableSheet(
                      initialChildSize: 0.8,
                      maxChildSize: 1.0,
                      minChildSize: 0.6,

                      builder:(context, scrollController) {
                        return Container(

                          decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),)
                          ),
                          child: ListView(
                            controller: scrollController,
                            children: [
                              ListTile(
                                title: Text('page Title'),
                                trailing: Icon(Icons.close),
                                onTap: () => (
                                  Navigator.pop(context)
                                ),

                              ),
                               const Padding
                              (padding:EdgeInsets.all(16) ,
                              child: Text('cargo description'),)

                            ],
                          ),
                        );
                      } )
                      );
                   
                                },
                                child: const Icon(Icons.info),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                                    )
                                  ]),
                  )


                 
              ),
        ));
  }
}
