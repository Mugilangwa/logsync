import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Welcome extends StatelessWidget{
  
 
  const Welcome({super.key});
  @override
  Widget build(BuildContext context){

      return Scaffold(
       
     body: Column(
      
      children: [
        Expanded(
          flex: 6,
          child: Container( 
            
            decoration: const BoxDecoration(
              image: DecorationImage(
                image:AssetImage('assets/job.jpg'),
                fit: BoxFit.cover),
              
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)
              )
            ),
           
            )
          ),

        Expanded(
          flex: 4,
            child: Column(
              children: [
            
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,vertical:9),
                  child: Text( 
                    "Your Logistic Partner For Seamless Delivery",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 1.9,
                                          ),
                    ),
                ),
                  const SizedBox(height: 1),
                 const Padding(
                   padding: EdgeInsets.symmetric(
                    horizontal: 16,vertical: 1),
                   child: Text(
                    "Our logistic Service provider end to end solution for all your needs",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    ),
                 ),
            
                 const SizedBox(height: 50,),
                  
                  SizedBox(
                  width: 320,
                  height: 50,
                  child: ElevatedButton(
                    
                    onPressed:() {
                      context.go('/account/login');
                     },
                    style: ElevatedButton.styleFrom(
                  
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.amber, // Text color
                    padding: const EdgeInsets.symmetric(horizontal:2, vertical: 10), // Button padding
                    shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13)
                      )
                    ), 
                    child: const Text("GET STARTED",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                    
                    ),
                )
            
              ],
              
              
            ),
          ),
        ],
     ),
      );
  }
}