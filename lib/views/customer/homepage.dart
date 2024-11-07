import 'dart:ui';

import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color.fromARGB(255, 227, 185, 235),
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
            
        
        //list nanigation bar
             Row(
                children: [

                  Expanded(
                    child: SizedBox(
                      height: 60,
                      child: TextButton.icon(
                        onPressed: (){
                          
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
                  ) ,  
                   const  SizedBox(width: 10),
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