

import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor:Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
           
               Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  height: 150,
                 
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.purple,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        SearchBar(
                          hintText: 'Search with your Request Id',
                          leading: Icon(Icons.search),
                          backgroundColor: WidgetStatePropertyAll(Colors.white), // Set SearchBar background to pure white
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            
        
        //list navigation bar
             Row(
                children: [

                  Expanded(
                    child: SizedBox(
                      height: 60,
                      child: TextButton.icon(
                        onPressed: (){
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                             builder: (context) => 
                              DraggableScrollableSheet(
                                initialChildSize: 0.8,
                                maxChildSize: 1,
                                minChildSize: 0.6,
                                builder:(context ,scrollController){
                                  return Container(
                                    decoration:const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      )
                                    ),
                                   child: ListView(
                                    controller: scrollController,
                                    children: [
                                      ListTile(
                                        title: const Text('Request Descriptions'),
                                        trailing: const Icon(
                                          Icons.close,
                                           ),
                                           onTap:() =>
                                           (Navigator.pop(context)),
                                           tileColor: Colors.purple,
                                      ),
                                       Center(
                                         child: Padding(
                                           padding: const EdgeInsets.all(30),
                                           child: Container(
                                            decoration:BoxDecoration(
                                              color: const Color.fromARGB(239, 233, 218, 238),
                                               borderRadius: BorderRadius.circular(25)
                                              ),
                                            
                                             child: Padding(
                                                padding: const EdgeInsets.all( 20),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    //pickup location
                                                    const Row(
                                                        children: [
                                                          Text('Pickup Location:',
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight: FontWeight.w500,
                                                            color: Colors.black
                                                          )
                                                          ),
                                                          SizedBox(width: 5),
                                                          Text('mnazi mmoja',
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.purple
                                                          )
                                                          )
                                                        ],
                                                      ) ,
                                                      const SizedBox(height: 20,),
                                                    //dropup location 
                                                    const Row(
                                                        children: [
                                                          Text('DropUp Location:',
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight: FontWeight.w500,
                                                            color: Colors.black
                                                          )
                                                          ),
                                                          SizedBox(width: 5),
                                                          Text('Tegeta',
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.purple
                                                          )
                                                          )
                                                        ],
                                                      ) ,
                                                      const SizedBox(height: 20,),
                                                    //cargo description
                                                    const Row(
                                                        children: [
                                                          Text('Cargo Description:',
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight: FontWeight.w500,
                                                            color: Colors.black
                                                          )
                                                          ),
                                                          SizedBox(width: 5),
                                                          Text('',
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.purple
                                                          )
                                                          )
                                                        ],
                                                      ) ,
                                                      const SizedBox(height: 20,),
                                                    // price 
                                                    const Row(
                                                        children: [
                                                          Text('Price',
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight: FontWeight.w500,
                                                            color: Colors.black
                                                          )
                                                          ),
                                                          SizedBox(width: 5),
                                                          Text('',
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.purple
                                                          )
                                                          )
                                                        ],
                                                      ) ,
                                                      const SizedBox(height: 30,),
                                                      ElevatedButton(
                                                        onPressed:() {
                                                          Navigator.push(context, MaterialPageRoute(builder:(context) => const TrackCorgo()));
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
                                                          fontSize: 20,
                                                          
                                                        ),)
                                                        
                                                        )
                                                  ],
                                                ),
                                                ),
                                           ),
                                         ),
                                       )
                                    ],
                                   ),

                                  );
                                }
                                 )
                             
                             );
                        }, 
                        label: const Text('Active Request',
                         style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                         ),
                        ),
                        style: const ButtonStyle(
                         backgroundColor: WidgetStatePropertyAll(Colors.white),
                         
                        )
                        
                        ),
                    ),
                  ) ,  
                   const  SizedBox(width: 9),
                  Expanded(
                    child: SizedBox(height: 60,
                      child: TextButton.icon(
                        onPressed: (){
                          Navigator.push(
                            context, MaterialPageRoute(builder: (context) =>  const TrackCorgo()));
                        }, 
                        label: const Text('Track Order',
                         style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                         ),
                        ),
                        style: const ButtonStyle(
                         backgroundColor: WidgetStatePropertyAll(Colors.white),
                         
                        )
                        
                        ),
                    ),
                  )   
                ],
              )
        
        
        
          ],
        ),
      ),
    );
  }
}

class TrackCorgo extends StatelessWidget{
   
  const TrackCorgo({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       body: Center(
        child: ElevatedButton(
          onPressed: () {
           Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );


  }

}