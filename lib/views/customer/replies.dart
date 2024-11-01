import 'package:flutter/material.dart';


// ignore: must_be_immutable
class Replies extends StatelessWidget {
  final requestFormKey = GlobalKey<FormState>();

    Replies({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: const Text('Number of Replies')),
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
                            borderRadius: BorderRadius.circular(15),
                          ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: 
                        [
                        ElevatedButton(
                         child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8),
                               child: Text('Request ID'),
                              ),
                               Text('45000')
                               
                          ],
                          ),
                            onPressed: (){
                           
                            showDialog(
                              context: context,
                               builder:(BuildContext content){
                                return 
                                 Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Container(
                                   padding:const EdgeInsets.all(20),
                                   width: double.infinity,
                                   child: Column(
                                   
                                    children: [
                                      Center(
                                        child: Container(
                                                                            decoration: BoxDecoration(
                                                                            color: Theme.of(context).primaryColor,
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                           topRight: Radius.circular(15),
                                             ),
                                                                            ),
                                        
                                                                             child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                                 const Text('Price Negotiation',
                                                 style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold
                                                 ),
                                                 ),
                                                 IconButton(
                                                  onPressed: (){
                                                    Navigator.of(content).pop();
                                                  },
                                                   icon:const Icon(Icons.cancel , color: Colors.white,))
                                                 
                                        ],
                                        )
                                        ),
                                      ),
                                    
                                    const Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Text(
                                          "the price negotation will be seen here" 
                                         " like chatin"
                                        ),
                                        ),
                                      ),

                                 const   SizedBox(height: 25),
                                     Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Row(
                                        children: [
                                           ElevatedButton(
                                          onPressed: (){
                                            Navigator.of(content).pop();
                                          },
                                          
                                           child:const Text('Negotiate')),
                                           const Spacer(),
                                                                          ElevatedButton(
                                          onPressed: (){
                                            Navigator.of(content).pop();
                                          },
                                          
                                           child: const Text('Confirm'))
                                                                         
                                        ],
                                       ),
                                     )
                                       ],
                                    
                                   ),
                                  ),
                                );
                               }

                               );
                            }, 
                            )
                ,
                const  SizedBox(height: 15,),
                  ElevatedButton(
                         child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8),
                               child: Text('Request ID'),
                              ),
                               Text('45000')
                               
                          ],
                          ),
                            onPressed: (){
                           
                            showDialog(
                              context: context,
                               builder:(BuildContext content){
                                return 
                                 Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Container(
                                   padding:const EdgeInsets.all(20),
                                   width: double.infinity,
                                   child: Column(
                                   
                                    children: [
                                      Center(
                                        child: Container(
                                                                            decoration: BoxDecoration(
                                                                            color: Theme.of(context).primaryColor,
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                           topRight: Radius.circular(15),
                                             ),
                                                                            ),
                                        
                                                                             child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                                 const Text('Price Negotiation',
                                                 style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold
                                                 ),
                                                 ),
                                                 IconButton(
                                                  onPressed: (){
                                                    Navigator.of(content).pop();
                                                  },
                                                   icon:const Icon(Icons.cancel , color: Colors.white,))
                                                 
                                        ],
                                        )
                                        ),
                                      ),
                                    
                                    const Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Text(
                                          "the price negotation will be seen here" 
                                         " like chatin"
                                        ),
                                        ),
                                      ),

                                 const   SizedBox(height: 25),
                                     Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Row(
                                        children: [
                                           ElevatedButton(
                                          onPressed: (){
                                            Navigator.of(content).pop();
                                          },
                                          
                                           child:const Text('Negotiate')),
                                           const Spacer(),
                                                                          ElevatedButton(
                                          onPressed: (){
                                            Navigator.of(content).pop();
                                          },
                                          
                                           child: const Text('Confirm'))
                                                                         
                                        ],
                                       ),
                                     )
                                       ],
                                    
                                   ),
                                  ),
                                );
                               }

                               );
                            }, 
                            ),
                 const  SizedBox(height: 15,),
                   ElevatedButton(
                         child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8),
                               child: Text('Request ID'),
                              ),
                               Text('45000')
                               
                          ],
                          ),
                            onPressed: (){
                           
                            showDialog(
                              context: context,
                               builder:(BuildContext content){
                                return 
                                 Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Container(
                                   padding:const EdgeInsets.all(20),
                                   width: double.infinity,
                                   child: Column(
                                   
                                    children: [
                                      Center(
                                        child: Container(
                                                                            decoration: BoxDecoration(
                                                                            color: Theme.of(context).primaryColor,
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                           topRight: Radius.circular(15),
                                             ),
                                                                            ),
                                        
                                                                             child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                                 const Text('Price Negotiation',
                                                 style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold
                                                 ),
                                                 ),
                                                 IconButton(
                                                  onPressed: (){
                                                    Navigator.of(content).pop();
                                                  },
                                                   icon:const Icon(Icons.cancel , color: Colors.white,))
                                                 
                                        ],
                                        )
                                        ),
                                      ),
                                    
                                    const Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Text(
                                          "the price negotation will be seen here" 
                                         " like chatin"
                                        ),
                                        ),
                                      ),

                                 const   SizedBox(height: 25),
                                     Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Row(
                                        children: [
                                           ElevatedButton(
                                          onPressed: (){
                                            Navigator.of(content).pop();
                                          },
                                          
                                           child:const Text('Negotiate')),
                                           const Spacer(),
                                                                          ElevatedButton(
                                          onPressed: (){
                                            Navigator.of(content).pop();
                                          },
                                          
                                           child: const Text('Confirm'))
                                                                         
                                        ],
                                       ),
                                     )
                                       ],
                                    
                                   ),
                                  ),
                                );
                               }

                               );
                            }, 
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